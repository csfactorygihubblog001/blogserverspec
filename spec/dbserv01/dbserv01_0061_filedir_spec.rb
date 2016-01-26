require 'spec_helper'


describe "============= fileDir ============= " do
  describe file('/var/opt/data') do
    it { should be_directory }
    it { should be_mode '755' }
    it { should be_owned_by 'infra' }
    it { should be_grouped_into 'infra' }
  end

  describe file('/var/opt/data/nfs') do
    it { should be_directory }
    it { should be_mode '755' }
    it { should be_owned_by 'infra' }
    it { should be_grouped_into 'infra' }
  end

  describe file('/var/opt/data/mysql') do
    it { should be_directory }
    it { should be_mode '755' }
    it { should be_owned_by 'mysql' }
    it { should be_grouped_into 'mysql' }
  end

end
