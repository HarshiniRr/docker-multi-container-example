# -*- mode: ruby -*-
# vi: set ft=ruby :

# Set default provider to docker
ENV['VAGRANT_DEFAULT_PROVIDER'] = 'docker'

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # PHP container
  config.vm.define 'php' do |php|
    php.vm.provider "docker" do |docker|
      docker.build_dir = "php"
      docker.name = "dmc-php"
    end
    php.vm.synced_folder "php/", "/srv/app", owner: "www-data", group: "www-data"
  end

  # nginx container
  config.vm.define 'nginx' do |nginx|
    nginx.vm.provider "docker" do |docker|
      docker.build_dir = "nginx"
      docker.name = "dmc-nginx"
      docker.ports = ["8080:80"]
      docker.link("dmc-php:php")
    end
    nginx.vm.synced_folder "php/", "/srv/app", owner: "www-data", group: "www-data"
  end

end