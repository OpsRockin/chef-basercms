#
# Cookbook Name:: basercms
# Recipe:: apache
#
# Copyright 2014, DigitalCube, Inc.
#

include_recipe %w{apache2 apache2::mod_expires apache2::mod_php5 apache2::mod_rewrite}

directory node['basercms']['install_path'] do
  user   node[:apache][:user]
  group  node[:apache][:group]
  mode   0755
  action :create
end

web_app "basercms" do
  template "basercms.conf.erb"
  server_name node[:fqdn]
  docroot File.join(node[:basercms][:install_path])
  notifies :restart, "service[apache2]"
end
