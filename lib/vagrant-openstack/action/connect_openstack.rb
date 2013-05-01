require 'fog'
require 'log4r'

module VagrantPlugins
    module OpenStack
        module Action
            class ConnectOpenStack
                def initialize(app, env)
                    @app = app
                    @logger = Log4r::Logger.new("vagrant_openstack::action::connect_openstack")
                end

                def call(env)
                    config = env[:machine].provider_config
                    os_endpoint = config.os_endpoint
                    os_username = config.os_username
                    os_password = config.os_password

                    @logger.info("Connecting to OpenStack...")
                    env[:openstack_compute] = Fog::Compute.new({
                        :provider => "OpenStack",
                        :openstack_auth_url => os_endpoint,
                        :openstack_username => os_username,
                        :openstack_api_key => os_password
                        :openstack_tenant => os_tenant
                        })
                    logger.info("list of servers " + env[:openstack_compute].list_servers)

                    @app.call(env)
                end
            end
        end
    end
end
