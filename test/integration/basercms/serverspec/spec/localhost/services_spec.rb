require File.expand_path('../../spec_helper', __FILE__)

%w{httpd mysqld}.each do |svc|
  describe service(svc) do
    it { should be_enabled   }
    it { should be_running   }
  end
end

describe port(80) do
  it { should be_listening }
end

describe port(3306) do
  it { should be_listening }
end

describe host($ohaidata[:ipaddress]) do
  it { should_not be_reachable.with( :port => 3306, :proto => 'tcp' ) }
end
