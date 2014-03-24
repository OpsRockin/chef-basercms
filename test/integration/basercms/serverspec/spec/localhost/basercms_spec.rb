require File.expand_path('../../spec_helper', __FILE__)

describe command('curl localhost') do
  it { should return_stdout /baserCMS/ }
end
