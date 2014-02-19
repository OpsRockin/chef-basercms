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
	'php-cli',
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
	"default_charset" => "UTF-8",
	"mbstring.language" => "neutral",
	"mbstring.internal_encoding" => "UTF-8",
	"date.timezone" => "Asia/Tokyo"
}

# MySQL
default['mysql']['server_root_password']   = 'mysql'
default['mysql']['server_repl_password']   = 'mysql'
default['mysql']['server_debian_password'] = 'mysql'

# baserCMS
default[:basercms][:install_path]   = '/var/www/basercms'
# default[:basercms][:app_tmp]   = '/var/www/basercms/app/tmp'

default[:basercms][:db][:name] = "basercms"
default[:basercms][:db][:user] = "basercms"
default[:basercms][:db][:pass] = "basercms"
default[:basercms][:db][:host] = 'localhost'

default[:basercms][:git_repository] = 'https://github.com/basercms/basercms.git';
default[:basercms][:git_revision]   = 'basercms-3.0.1';
