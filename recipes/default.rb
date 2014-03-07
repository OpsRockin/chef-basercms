#
# Cookbook Name:: basercms
# Recipe:: default
#
# Copyright 2014, DigitalCube Co. Ltd.
#
# All rights reserved - Do Not Redistribute
#
#include_recipe 'basercms::yum-update'

packages = %w{ zip unzip wget git }

packages.each do |pkg|
  package pkg do
    action [:install, :upgrade]
  end
end

include_recipe 'basercms::apache2'
include_recipe 'basercms::php'
include_recipe 'basercms::mysql'

git node['basercms']['install_path'] do
    repository node[:basercms][:git_repository]
    revision   node[:basercms][:git_revision]
    user       node[:apache][:user]
    group      node[:apache][:group]
    action     :checkout
end

template "#{node['basercms']['install_path']}/setup.sh" do
  mode   "0644"
  user   node[:apache][:user]
  group  node[:apache][:group]
  source "setup.sh.erb"
end

execute "setup" do
  command "sh #{node['basercms']['install_path']}/setup.sh"
  user    node[:apache][:user]
  group   node[:apache][:group]
  action  :run
end
