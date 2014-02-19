#
# Cookbook Name:: basercms
# Recipe:: default
#
# Copyright 2014, DigitalCube Co. Ltd.
#
# All rights reserved - Do Not Redistribute
#
#include_recipe 'basercms::yum-update'

packages = %w{git}

packages.each do |pkg|
  package pkg do
    action [:install, :upgrade]
  end
end

include_recipe 'basercms::cakephp'
include_recipe 'basercms::apache2'
include_recipe 'basercms::php'
include_recipe 'basercms::mysql'

git node['basercms']['install_path'] do
    repository  node[:basercms][:git_repository]
    revision    node[:basercms][:git_revision]
    user        node[:apache][:user]
    group       node[:apache][:group]
    action      :checkout
end
