require 'serverspec'

$LOAD_PATH.concat Dir.glob('/opt/chef/embedded/lib/ruby/gems/1.9.1/gems/*/lib')
require 'ohai'

include SpecInfra::Helper::Exec
include SpecInfra::Helper::DetectOS

RSpec.configure do |c|
  if ENV['ASK_SUDO_PASSWORD']
    require 'highline/import'
    c.sudo_password = ask("Enter sudo password: ") { |q| q.echo = false }
  else
    c.sudo_password = ENV['SUDO_PASSWORD']
  end
end

ohai = Ohai::System.new
ohai.hints = {"ec2"=>{}}
ohai.all_plugins
$ohaidata = ohai.data
