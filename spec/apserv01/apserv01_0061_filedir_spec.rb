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


  describe file('/opt/tomcat') do
    it {should be_dirctory }
    it { should be_mode '755'}
    it { should be_owner 'tomcat'}
    it { should be_group_into 'tomcat'}
  end

  describe file('/var/opt/data/tomcat/webapps') do
    it {should be_dirctory }
    it { should be_mode '755'}
    it { should be_owner 'tomcat'}
    it { should be_group_into 'tomcat'}
  end

  describe file('/var/opt/data/tomcat/work') do
    it {should be_dirctory }
    it { should be_mode '755'}
    it { should be_owner 'tomcat'}
    it { should be_group_into 'tomcat'}
  end

  describe file('/etc/ssl/apserv_cets') do
    it {should be_dirctory }
    it { should be_mode '755'}
    it { should be_owner 'root'}
    it { should be_group_into 'root'}
  end
end
