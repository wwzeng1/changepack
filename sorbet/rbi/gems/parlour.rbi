# This file is autogenerated. Do not edit it by hand. Regenerate it with:
#   srb rbi gems

# typed: strict
#
# If you would like to make changes to this file, great! Please create the gem's shim here:
#
#   https://github.com/sorbet/sorbet-typed/new/master?filename=lib/parlour/all/parlour.rbi
#
# parlour-6.0.1

module Parlour
end
module Parlour::Debugging
  extend T::Private::Methods::MethodHooks
  extend T::Private::Methods::SingletonMethodHooks
  extend T::Sig
end
module Parlour::Debugging::Tree
  extend T::Private::Methods::MethodHooks
  extend T::Private::Methods::SingletonMethodHooks
  extend T::Sig
end
module Kernel
end
class Parlour::Plugin
  extend T::Helpers
  extend T::InterfaceWrapper::Helpers
  extend T::Private::Abstract::Hooks
  extend T::Private::Methods::MethodHooks
  extend T::Private::Methods::SingletonMethodHooks
  extend T::Sig
end
module Parlour::Types
end
class Parlour::Types::Type
  extend T::Helpers
  extend T::InterfaceWrapper::Helpers
  extend T::Private::Abstract::Hooks
  extend T::Private::Methods::MethodHooks
  extend T::Private::Methods::SingletonMethodHooks
  extend T::Sig
end
class Parlour::Types::Raw < Parlour::Types::Type
  extend T::Private::Methods::MethodHooks
  extend T::Private::Methods::SingletonMethodHooks
end
class Parlour::Types::Nilable < Parlour::Types::Type
  extend T::Private::Methods::MethodHooks
  extend T::Private::Methods::SingletonMethodHooks
end
class Parlour::Types::Union < Parlour::Types::Type
  extend T::Private::Methods::MethodHooks
  extend T::Private::Methods::SingletonMethodHooks
end
class Parlour::Types::Intersection < Parlour::Types::Type
  extend T::Private::Methods::MethodHooks
  extend T::Private::Methods::SingletonMethodHooks
end
class Parlour::Types::Tuple < Parlour::Types::Type
  extend T::Private::Methods::MethodHooks
  extend T::Private::Methods::SingletonMethodHooks
end
class Parlour::Types::Generic < Parlour::Types::Type
  extend T::Private::Methods::MethodHooks
  extend T::Private::Methods::SingletonMethodHooks
end
class Parlour::Types::SingleElementCollection < Parlour::Types::Type
  extend T::InterfaceWrapper::Helpers
  extend T::Private::Abstract::Hooks
  extend T::Private::Methods::MethodHooks
  extend T::Private::Methods::SingletonMethodHooks
end
class Parlour::Types::Array < Parlour::Types::SingleElementCollection
  extend T::Private::Methods::MethodHooks
  extend T::Private::Methods::SingletonMethodHooks
end
class Parlour::Types::Set < Parlour::Types::SingleElementCollection
  extend T::Private::Methods::MethodHooks
  extend T::Private::Methods::SingletonMethodHooks
end
class Parlour::Types::Range < Parlour::Types::SingleElementCollection
  extend T::Private::Methods::MethodHooks
  extend T::Private::Methods::SingletonMethodHooks
end
class Parlour::Types::Enumerable < Parlour::Types::SingleElementCollection
  extend T::Private::Methods::MethodHooks
  extend T::Private::Methods::SingletonMethodHooks
end
class Parlour::Types::Enumerator < Parlour::Types::SingleElementCollection
  extend T::Private::Methods::MethodHooks
  extend T::Private::Methods::SingletonMethodHooks
end
class Parlour::Types::Hash < Parlour::Types::Type
  extend T::Private::Methods::MethodHooks
  extend T::Private::Methods::SingletonMethodHooks
end
class Parlour::Types::Record < Parlour::Types::Type
  extend T::Private::Methods::MethodHooks
  extend T::Private::Methods::SingletonMethodHooks
end
class Parlour::Types::Class < Parlour::Types::Type
  extend T::Private::Methods::MethodHooks
  extend T::Private::Methods::SingletonMethodHooks
end
class Parlour::Types::Boolean < Parlour::Types::Type
  extend T::Private::Methods::MethodHooks
  extend T::Private::Methods::SingletonMethodHooks
end
class Parlour::Types::Self < Parlour::Types::Type
  extend T::Private::Methods::MethodHooks
  extend T::Private::Methods::SingletonMethodHooks
end
class Parlour::Types::Untyped < Parlour::Types::Type
  extend T::Private::Methods::MethodHooks
  extend T::Private::Methods::SingletonMethodHooks
end
class Parlour::Types::Proc < Parlour::Types::Type
  extend T::Private::Methods::MethodHooks
  extend T::Private::Methods::SingletonMethodHooks
end
class Parlour::Types::Proc::Parameter
  extend T::Private::Methods::MethodHooks
  extend T::Private::Methods::SingletonMethodHooks
  extend T::Sig
end
class Parlour::Options
  extend T::Private::Methods::MethodHooks
  extend T::Private::Methods::SingletonMethodHooks
  extend T::Sig
end
class Parlour::TypedObject
  extend T::Helpers
  extend T::InterfaceWrapper::Helpers
  extend T::Private::Abstract::Hooks
  extend T::Private::Methods::MethodHooks
  extend T::Private::Methods::SingletonMethodHooks
  extend T::Sig
end
class Parlour::Generator
  extend T::Private::Methods::MethodHooks
  extend T::Private::Methods::SingletonMethodHooks
  extend T::Sig
end
class Parlour::RbiGenerator < Parlour::Generator
  extend T::Private::Methods::MethodHooks
  extend T::Private::Methods::SingletonMethodHooks
end
class Parlour::RbiGenerator::Parameter
  extend T::Private::Methods::MethodHooks
  extend T::Private::Methods::SingletonMethodHooks
  extend T::Sig
end
class Parlour::RbiGenerator::RbiObject < Parlour::TypedObject
  extend T::InterfaceWrapper::Helpers
  extend T::Private::Abstract::Hooks
  extend T::Private::Methods::MethodHooks
  extend T::Private::Methods::SingletonMethodHooks
end
class Parlour::RbiGenerator::TypeAlias < Parlour::RbiGenerator::RbiObject
  extend T::Private::Methods::MethodHooks
  extend T::Private::Methods::SingletonMethodHooks
end
class Parlour::RbiGenerator::Method < Parlour::RbiGenerator::RbiObject
  extend T::Private::Methods::MethodHooks
  extend T::Private::Methods::SingletonMethodHooks
  extend T::Sig
end
class Parlour::RbiGenerator::Attribute < Parlour::RbiGenerator::Method
  extend T::Private::Methods::MethodHooks
  extend T::Private::Methods::SingletonMethodHooks
end
class Parlour::RbiGenerator::Arbitrary < Parlour::RbiGenerator::RbiObject
  extend T::Private::Methods::MethodHooks
  extend T::Private::Methods::SingletonMethodHooks
end
class Parlour::RbiGenerator::Include < Parlour::RbiGenerator::RbiObject
  extend T::Private::Methods::MethodHooks
  extend T::Private::Methods::SingletonMethodHooks
end
class Parlour::RbiGenerator::Extend < Parlour::RbiGenerator::RbiObject
  extend T::Private::Methods::MethodHooks
  extend T::Private::Methods::SingletonMethodHooks
end
class Parlour::RbiGenerator::Constant < Parlour::RbiGenerator::RbiObject
  extend T::Private::Methods::MethodHooks
  extend T::Private::Methods::SingletonMethodHooks
end
class Parlour::RbiGenerator::Namespace < Parlour::RbiGenerator::RbiObject
  extend T::Private::Methods::MethodHooks
  extend T::Private::Methods::SingletonMethodHooks
  extend T::Sig
end
class Parlour::RbiGenerator::ModuleNamespace < Parlour::RbiGenerator::Namespace
  extend T::Private::Methods::MethodHooks
  extend T::Private::Methods::SingletonMethodHooks
  extend T::Sig
end
class Parlour::RbiGenerator::ClassNamespace < Parlour::RbiGenerator::Namespace
  extend T::Private::Methods::MethodHooks
  extend T::Private::Methods::SingletonMethodHooks
  extend T::Sig
end
class Parlour::RbiGenerator::EnumClassNamespace < Parlour::RbiGenerator::ClassNamespace
  extend T::Private::Methods::MethodHooks
  extend T::Private::Methods::SingletonMethodHooks
  extend T::Sig
end
class Parlour::RbiGenerator::StructProp
  extend T::Private::Methods::MethodHooks
  extend T::Private::Methods::SingletonMethodHooks
  extend T::Sig
end
class Parlour::RbiGenerator::StructClassNamespace < Parlour::RbiGenerator::ClassNamespace
  extend T::Private::Methods::MethodHooks
  extend T::Private::Methods::SingletonMethodHooks
  extend T::Sig
end
class Parlour::DetachedRbiGenerator < Parlour::RbiGenerator
  extend T::Private::Methods::MethodHooks
  extend T::Private::Methods::SingletonMethodHooks
end
class Parlour::RbsGenerator < Parlour::Generator
  extend T::Private::Methods::MethodHooks
  extend T::Private::Methods::SingletonMethodHooks
end
class Parlour::RbsGenerator::RbsObject < Parlour::TypedObject
  extend T::InterfaceWrapper::Helpers
  extend T::Private::Abstract::Hooks
  extend T::Private::Methods::MethodHooks
  extend T::Private::Methods::SingletonMethodHooks
end
class Parlour::RbsGenerator::TypeAlias < Parlour::RbsGenerator::RbsObject
  extend T::Private::Methods::MethodHooks
  extend T::Private::Methods::SingletonMethodHooks
end
class Parlour::RbsGenerator::Namespace < Parlour::RbsGenerator::RbsObject
  extend T::Private::Methods::MethodHooks
  extend T::Private::Methods::SingletonMethodHooks
  extend T::Sig
end
class Parlour::RbsGenerator::Method < Parlour::RbsGenerator::RbsObject
  extend T::Private::Methods::MethodHooks
  extend T::Private::Methods::SingletonMethodHooks
  extend T::Sig
end
class Parlour::RbsGenerator::Arbitrary < Parlour::RbsGenerator::RbsObject
  extend T::Private::Methods::MethodHooks
  extend T::Private::Methods::SingletonMethodHooks
end
class Parlour::RbsGenerator::Attribute < Parlour::RbsGenerator::Method
  extend T::Private::Methods::MethodHooks
  extend T::Private::Methods::SingletonMethodHooks
  extend T::Sig
end
class Parlour::RbsGenerator::Block
  extend T::Private::Methods::MethodHooks
  extend T::Private::Methods::SingletonMethodHooks
  extend T::Sig
end
class Parlour::RbsGenerator::ClassNamespace < Parlour::RbsGenerator::Namespace
  extend T::Private::Methods::MethodHooks
  extend T::Private::Methods::SingletonMethodHooks
  extend T::Sig
end
class Parlour::RbsGenerator::Constant < Parlour::RbsGenerator::RbsObject
  extend T::Private::Methods::MethodHooks
  extend T::Private::Methods::SingletonMethodHooks
end
class Parlour::RbsGenerator::Extend < Parlour::RbsGenerator::RbsObject
  extend T::Private::Methods::MethodHooks
  extend T::Private::Methods::SingletonMethodHooks
end
class Parlour::RbsGenerator::Include < Parlour::RbsGenerator::RbsObject
  extend T::Private::Methods::MethodHooks
  extend T::Private::Methods::SingletonMethodHooks
end
class Parlour::RbsGenerator::MethodSignature
  extend T::Private::Methods::MethodHooks
  extend T::Private::Methods::SingletonMethodHooks
  extend T::Sig
end
class Parlour::RbsGenerator::ModuleNamespace < Parlour::RbsGenerator::Namespace
  extend T::Private::Methods::MethodHooks
  extend T::Private::Methods::SingletonMethodHooks
  extend T::Sig
end
class Parlour::RbsGenerator::InterfaceNamespace < Parlour::RbsGenerator::Namespace
  extend T::Private::Methods::MethodHooks
  extend T::Private::Methods::SingletonMethodHooks
  extend T::Sig
end
class Parlour::RbsGenerator::Parameter
  extend T::Private::Methods::MethodHooks
  extend T::Private::Methods::SingletonMethodHooks
  extend T::Sig
end
class Parlour::DetachedRbsGenerator < Parlour::RbsGenerator
  extend T::Private::Methods::MethodHooks
  extend T::Private::Methods::SingletonMethodHooks
end
module Parlour::Conversion
end
class Parlour::Conversion::Converter
  extend T::Helpers
  extend T::InterfaceWrapper::Helpers
  extend T::Private::Abstract::Hooks
  extend T::Private::Methods::MethodHooks
  extend T::Private::Methods::SingletonMethodHooks
  extend T::Sig
end
class Parlour::Conversion::RbiToRbs < Parlour::Conversion::Converter
  extend T::Private::Methods::MethodHooks
  extend T::Private::Methods::SingletonMethodHooks
  extend T::Sig
end
class Parlour::ConflictResolver
  extend T::Private::Methods::MethodHooks
  extend T::Private::Methods::SingletonMethodHooks
  extend T::Sig
end
class Parlour::ParseError < StandardError
  extend T::Private::Methods::MethodHooks
  extend T::Private::Methods::SingletonMethodHooks
  extend T::Sig
end
class Parlour::TypeParser
  extend T::Private::Methods::MethodHooks
  extend T::Private::Methods::SingletonMethodHooks
  extend T::Sig
end
class Parlour::TypeParser::NodePath
  extend T::Private::Methods::MethodHooks
  extend T::Private::Methods::SingletonMethodHooks
  extend T::Sig
end
class Parlour::TypeParser::IntermediateSig < T::Struct
  extend T::Props::ClassMethods
  extend T::Props::Plugin::ClassMethods
  extend T::Props::Plugin::ClassMethods
  extend T::Props::Plugin::ClassMethods
  extend T::Props::Plugin::ClassMethods
  extend T::Props::Plugin::ClassMethods
  extend T::Props::Serializable::ClassMethods
end
module Parlour::TypeLoader
  extend T::Private::Methods::MethodHooks
  extend T::Private::Methods::SingletonMethodHooks
  extend T::Sig
end
