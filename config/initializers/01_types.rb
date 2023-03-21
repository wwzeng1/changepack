module T
  def self.instance(__typed)
    ar_type_value = Class.new(ActiveRecord::Type::Value) do
      attr_reader :__typed

      def initialize(__typed:, **opts)
        @__typed = __typed
        super(**opts)
      end

      def cast(value)
        return value if value.is_a?(__typed)
        raise ArgumentError, "Value must be an instance of #{__typed}"
      end

      # These methods are required by ActiveRecord::Type::Value,
      # but we don't need to implement them since we're not
      # storing instances in the database.
      def serialize(value); end
      def deserialize(value); end
    end

    ar_type_value.new(__typed:)
  end

  def self.const_missing(name)
    model_name = name
    type_name = "T::#{name}"

    if const_defined?(model_name)
      # This is a bit hacky, but we use standard Rails autoload to load
      # the model and then `ActiveModel::T` automatically defines the
      # associated type for it.
      const_get(model_name)
      return const_get(type_name) if const_defined?(type_name)
    end

    super(name)
  end

  module Changepack
    module ClassMethods
      extend ActiveSupport::Concern

      class_methods do
        def __typed
          superclass
        end

        def call(val)
          T.let(val, __typed)
        end
      end
    end

    module ClassEval
      def call(val)
        T.let(val, self)
      end
    end
  end

  String = T.type_alias { ::String }
  Symbol = T.type_alias { ::Symbol }
  Integer = T.type_alias { ::Integer }
  Time = T.type_alias { T.any(::Time, DateTime, ActiveSupport::TimeWithZone) }
  Key = T.type_alias { T.any(String, Symbol) }
  Relation = T.type_alias { T.any(ActiveRecord::Associations::CollectionProxy, ActiveRecord::Relation, Array) }

  module Array
    include Changepack::ClassEval
  end

  module Hash
    include Changepack::ClassEval
  end

  module Enumerable
    include Changepack::ClassEval
  end

  module Enumerator
    include Changepack::ClassEval

    module Lazy
      include Changepack::ClassEval
    end

    module Chain
      include Changepack::ClassEval
    end
  end

  module Range
    include Changepack::ClassEval
  end

  module Set
    include Changepack::ClassEval
  end

  class Struct
    include Changepack::ClassEval

    extend T::Sig

    class << self
      # Consistency with `ActiveRecord::Attributes` and `Event`
      alias attribute const
    end
  end

  module Types
    class TypedHash
      include Changepack::ClassEval
    end

    class TypedArray
      include Changepack::ClassEval
    end

    class Union
      include Changepack::ClassEval
    end

    class Untyped
      include Changepack::ClassEval
    end
  end

  module Private
    module Types
      class SimplePairUnion
        include Changepack::ClassEval
      end

      class TypeAlias
        include Changepack::ClassEval
      end
    end
  end
end

module ActiveModel
  module T
    extend ActiveSupport::Concern

    def self.create_nested_module(mod, name_parts)
      if name_parts.count == 1
        return mod
      else
        next_part = name_parts.shift
        next_mod = mod.const_get(next_part) rescue nil

        unless next_mod
          next_mod = Module.new
          mod.const_set(next_part, next_mod)
        end

        create_nested_module(next_mod, name_parts)
      end
    end

    included do
      extend ::T::Sig
      # Define the nested T::[Model] class within the T module
      nested_mod = ActiveModel::T.create_nested_module(::T, name.split('::'))
      nested_mod.const_set("#{name.demodulize}", Class.new(self) do
        include ::T::Changepack::ClassMethods
      end)
    end
  end
end

module StoreModel
  T = ActiveModel::T
end
