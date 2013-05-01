require "pathname"
require "vagrant/action/builder"

module VagrantPlugins
    module OpenStack
        module Action
            include Vagrant::Action::Builtin

            def self.action_boot
                Vagrant::Action::Builder.new.tap do |b|
                    b.use ConfigValidate
                    b.use Call, IsCreated do |env, b2|
                        if env[:result]
                            b2.use MessageAlreadyCreated
                            next
                        end

                        b2.use ConnectOpenStack
#                        b2.use Provision
#                        b2.use CreateServer
                    end
                end
            end

            action_root = Pathname.new(File.expand_path("../action", __FILE__))
            autoload :ConnectOpenStack, action_root.join("connect_openstack")
#            autoload :CreateServer, action_root.join("create_server")
        end
    end
end