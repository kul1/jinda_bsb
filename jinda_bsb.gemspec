
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "jinda_bsb/version"

Gem::Specification.new do |spec|
  spec.name          = "jinda_bsb"
  spec.version       = JindaBsb::VERSION
  spec.authors       = ["P Kul"]
  spec.email         = ["1.0@kul.asia"]

  spec.summary       = %q{Theme AdminBSB for Jinda}
  spec.description   = %q{Required Jinda installed }
  spec.homepage      = "https://www.github.com/kul1/jinda-bsb"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "http://mygemserver.com"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = Dir["{lib,vendor}/**/*"]
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
