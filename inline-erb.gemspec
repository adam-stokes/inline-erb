# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "inline/erb/version"

Gem::Specification.new do |spec|
  spec.name          = "inline-erb"
  spec.version       = Inline::Erb::VERSION
  spec.authors       = ["Adam Stokes"]
  spec.email         = ["battlemidget@users.noreply.github.com"]

  spec.summary       = %q{Sinatra styled inline ERB templates.}
  spec.description   = %q{Adds inline template support, useful for quick scripts to keep everything in a single file.}
  spec.homepage      = "https://github.com/battlemidget/inline-erb"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 12.3.3"
  spec.add_development_dependency "minitest", "~> 5.0"
end
