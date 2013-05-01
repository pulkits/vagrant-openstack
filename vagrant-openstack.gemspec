# -*- encoding: utf-8 -*-
#$:.push File.expand_path("../lib", __FILE__)
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "vagrant-openstack/version"

Gem::Specification.new do |s|
  s.name        = "vagrant-openstack"
  s.version     = VagrantPlugins::OpenStack::VERSION
#  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Pulkit Singhal"]
  s.email       = ["pulkitatiiit@gmail.com"]
  s.homepage    = ""
  s.summary     = "Vagrant support for OpenStack"
  s.description = "Vagrant support for OpenStack"

  s.rubyforge_project = "vagrant-openstack"

  s.add_runtime_dependency "fog", "~> 1.10.0"

  s.add_development_dependency "rake"
#  gem.add_development_dependency "rspec", "~> 2.13.0"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
