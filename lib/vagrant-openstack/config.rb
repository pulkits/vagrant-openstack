require "vagrant"

module VagrantPlugins
    module OpenStack
        class Config < Vagrant.plugin("2", :config)

            attr_accessor: os_endpoint
            attr_accessor: os_username
            attr_accessor: os_password
            attr_accessor: os_tenant_name
            attr_accessor: os_flavor

            def initialize
                @os_endpoint = UNSET_VALUE
                @os_username = UNSET_VALUE
                @os_password = UNSET_VALUE
                @os_tenant_name = UNSET_VALUE
                @os_flavor = UNSET_VALUE
            end

            def finalize!
                @os_endpoint = nil if @os_endpoint == UNSET_VALUE
                @os_username = nil if @os_username == UNSET_VALUE
                @os_password = nil if @os_password == UNSET_VALUE
                @os_flavor = 'm1.tiny' if  @os_flavor == UNSET_VALUE
                @os_tenant_name = nil if @os_tenant_name == UNSET_VALUE

            def validate(machine)
                errors = []

                errors << I18n.t("vagrant_openstack.config.os_endpoint_required") if !@os_endpoint
                errors << I18n.t("vagrant_openstack.config.os_username_required") if !@os_username

                {"OpenStack Provider" => errors}
            end
        end
    end
end

