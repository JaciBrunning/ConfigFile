# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'configfile/version'

Gem::Specification.new do |spec|
  spec.name          = "configfile"
  spec.version       = ConfigFile::VERSION
  spec.authors       = ["Jaci Brunning"]
  spec.email         = ["jaci.brunning@gmail.com"]

  spec.summary       = %q{A simple reloadable config file system with defaults}
  spec.homepage      = "http://www.github.com/JacisNonsense/ConfigFile"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  # else
  #   raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  # end

  spec.files         = Dir.glob("lib/**/*") + ['Rakefile', "configfile.gemspec", 'Gemfile', 'LICENSE']
  spec.bindir        = "bin"
  spec.executables   = []
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_dependency "json"
end
