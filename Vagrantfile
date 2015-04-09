# -*- mode: ruby -*-
# vi: set ft=ruby :
VAGRANTFILE_API_VERSION = "2"


Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # base box and URL where to get it if not present
  config.vm.box = "hashicorp/precise64"


  config.vm.provider "virtualbox" do |v|
    v.memory = 4000
    v.name = "OpenTele_performance_test_box"
  end

  # config for the appserver box
  config.vm.define "opentele-perf-test-server" do |app|

    app.vm.host_name = "appserver01.local"

    app.vm.provision :puppet do |puppet|
      puppet.manifests_path = "manifests"
      puppet.manifest_file = "opentele.pp"
      puppet.module_path = "modules"
    end
  end
end
