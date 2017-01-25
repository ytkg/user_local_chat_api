# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'user_local_chat_api/version'

Gem::Specification.new do |spec|
  spec.name          = "user_local_chat_api"
  spec.version       = UserLocalChatApi::VERSION
  spec.authors       = ["Yoshiki Takagi"]
  spec.email         = ["yoshiki.tkg@gmail.com"]

  spec.summary       = %q{A Ruby wrapper of User Local API}
  spec.homepage      = "https://github.com/ytkg/user_local_chat_api"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "rest-client", "~> 2.0"

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
end
