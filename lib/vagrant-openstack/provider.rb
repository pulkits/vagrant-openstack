require "vagrant"

require "vagrant-os/action"

module VagrantPlugins
    module OpenStack
        class Provider < Vagrant.plugin("2", :provider)

            def initialize(machine)
                @machine = machine
            end

            def action(name)
                action_method = "action_#{name}"
                return Action.send(action_method) if Action.respond_to?(action_method)
                nil
            end

            def to_s
                "OpenStack Cloud"
            end
        end
    end
end
