begin
    require "vagrant"
rescue LoadError
    raise "The Vagrant-OpenStack plugin must be run within Vagrant"

if Vagrant::VERSION < "1.2.0"
    raise "The Vagrant AWS plugin is only compatible with Vagrant 1.2+"
end

module VagrantPlugins
    module OpenStack
        class Plugin < Vagrant.plugin('2')
            name "OpenStack"
            description <<-DESC
            This plugin enable Vagrant to run instances on OpenStack
            DESC

            config(:openstack, :provider) do 
                require_relative "config"
                Config                
            end

            provider(:openstack) do
                require_relative "provider"
                provider
            end
        end
    end
end
