lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "civ6/version"

Gem::Specification.new do |spec|
  spec.name          = "civ6"
  spec.version       = Civ6::VERSION
  spec.authors       = ["Soomin Hwang"]
  spec.email         = ["soomin.h.hwang@gmail.com"]

  spec.summary       = 'Civilizations of the Civ 6 Video Game'
  spec.description   = 'Use this application to learn more about the civilizations'
  spec.homepage      = "http://www.example.com"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
   # delete this section to allow pushing this gem to any host.
   if spec.respond_to?(:metadata)
     spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
   else
     raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
   end
  #
  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  #
  # spec.metadata["homepage_uri"] = spec.homepage
  # spec.metadata["source_code_uri"] = "TODO: Put your gem's public repo URL here."
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }

  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry"

  spec.add_dependency "nokogiri"

end
