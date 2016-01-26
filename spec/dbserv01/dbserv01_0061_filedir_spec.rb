require 'spec_helper'


describe "============= fileDir ============= " do
  describe file('/var/opt/data') do
    it { should be_dirctory }
    it { should be_mode '755' }
    it { should be_owner 'infra' }
    it { should be_group_into 'infra' }
  end

  describe file('/var/opt/data/nfs') do
    it { should be_dirctory }
    it { should be_mode '755' }
    it { should be_owner 'infra' }
    it { should be_group_into 'infra' }
  end

  describe file('/var/opt/data/mysql') do
    it { should be_dirctory }
    it { should be_mode '755' }
    it { should be_owner 'mysql' }
    it { should be_group_into 'mysql' }
  end

end
