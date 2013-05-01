require "pathname"
require "vagrant-os/plugin"

module VagrantPlugins
    module OpenStack
        lib_path = Pathname.new(File.expand_path("../vagrant-os", __FILE__))
        autoload :Action, lib_path.join("action")
        autoload :Errors, lib_path.join("errors")
    end
end
