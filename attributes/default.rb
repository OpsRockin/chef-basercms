# Apache
default['apache']['serversignature'] = 'Off'
=begin
default['apache']['default_modules'] = [
	'default',
	'status',
	'alias',
	'auth_basic',
	'authn_file',
	'authz_default',
	'authz_groupfile',
	'authz_host',
	'authz_user',
	'autoindex',
	'dir',
	'env',
	'mime',
	'negotiation',
	'setenvif',
	'rewrite',
	'expires',
	'php5'
]
=end

# PHP
default['php']['packages'] = [
	'php',
	'php-curl',
	'php-devel',
	'php-gd',
	'php-mbstring',
	'php-mysql',
	'php-pear',
	'php-pdo',
	'php-xml',
	'php-xmlrpc'
]
default['php']['directives'] = {
	"default_charset"            => "UTF-8",
	"mbstring.language"          => "neutral",
	"mbstring.internal_encoding" => "UTF-8",
	"date.timezone"              => "Asia/Tokyo"
}

# MySQL
if node.has_key?('ec2')
  default['mysql']['server_root_password']   = node[:ec2][:instance_id]
  default['mysql']['server_repl_password']   = node[:ec2][:instance_id]
  default['mysql']['server_debian_password'] = node[:ec2][:instance_id]
else
  default['mysql']['server_root_password']   = 'mysql'
  default['mysql']['server_repl_password']   = 'mysql'
  default['mysql']['server_debian_password'] = 'mysql'
end
default['mysql']['bind_address'] = '127.0.0.1'

# baserCMS
default[:basercms][:install_path] = '/var/www/basercms'
default[:basercms][:app_path]     = '/var/www/basercms/app'
default[:basercms][:lib_path]     = '/var/www/basercms/lib'

# baserCMS DB
default[:basercms][:db][:name]   = "basercms"
default[:basercms][:db][:user]   = "basercms"
if node.has_key?('ec2')
  default[:basercms][:db][:pass]   = node[:ec2][:instance_id]
else
  default[:basercms][:db][:pass]   = "basercms"
end

# baserCMS Git
default[:basercms][:git_repository] = 'https://github.com/basercms/basercms.git';
default[:basercms][:git_revision]   = 'basercms-3.0.1';
