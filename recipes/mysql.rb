#
# Cookbook Name:: basercms
# Recipe:: mysql
#
# Copyright 2014, DigitalCube, Inc.
#

include_recipe %w{mysql::client mysql::server database::mysql}

mysql_connection_info = {
    :host     => "localhost",
    :username => 'root',
    :password => node['mysql']['server_root_password']
}

mysql_database node['basercms']['db']['name'] do
  connection mysql_connection_info
  action     :create
end

mysql_database_user node['basercms']['db']['user'] do
  connection    mysql_connection_info
  password      node['basercms']['db']['pass']
  database_name node['basercms']['db']['name']
  privileges    [:all]
  action        [:create, :grant]
end
