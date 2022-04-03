# This file is autogenerated. Do not edit it by hand. Regenerate it with:
#   srb rbi gems

# typed: strict
#
# If you would like to make changes to this file, great! Please create the gem's shim here:
#
#   https://github.com/sorbet/sorbet-typed/new/master?filename=lib/coderay/all/coderay.rbi
#
# coderay-1.1.3

module CodeRay
end
module CodeRay::PluginHost
end
class CodeRay::PluginHost::PluginNotFound < LoadError
end
class CodeRay::PluginHost::HostNotFound < LoadError
end
module CodeRay::Encoders
  extend CodeRay::PluginHost
end
module CodeRay::Plugin
end
class CodeRay::Encoders::Encoder
  extend CodeRay::Plugin
end
class CodeRay::Encoders::Terminal < CodeRay::Encoders::Encoder
end
