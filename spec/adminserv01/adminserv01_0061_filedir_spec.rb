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
    it { should be_dirctory }
    it { should be_mode '755' }
    it { should be_owner 'tomcat' }
    it { should be_group_into 'tomcat' }
  end

  describe file('/var/opt/data/tomcat/webapps') do
    it { should be_dirctory }
    it { should be_mode '755' }
    it { should be_owner 'tomcat' }
    it { should be_group_into 'tomcat' }
  end

  describe file('/var/opt/data/tomcat/work') do
    it { should be_dirctory }
    it { should be_mode '755' }
    it { should be_owner 'tomcat' }
    it { should be_group_into 'tomcat' }
  end

  describe file('/var/opt/data/mysql') do
    it { should be_dirctory }
    it { should be_mode '755' }
    it { should be_owner 'mysql' }
    it { should be_group_into 'mysql' }
  end
  describe file('/var/opt/data/nfs/installer') do
    it { should be_dirctory }
    it { should be_mode '755' }
    it { should be_owner 'infra' }
    it { should be_group_into 'infra' }
  end

  describe file('/var/opt/data/nfs/work') do
    it { should be_dirctory }
    it { should be_mode '755' }
    it { should be_owner 'infra' }
    it { should be_group_into 'infra' }
  end

  describe file('/var/opt/data/nfs/settings') do
    it { should be_dirctory }
    it { should be_mode '755' }
    it { should be_owner 'infra' }
    it { should be_group_into 'infra' }
  end

  describe file('/var/opt/data/jenkins') do
    it { should be_dirctory }
    it { should be_mode '755' }
    it { should be_owner 'tomcat' }
    it { should be_group_into 'tomcat' }
  end

  describe file('/opt/selenium') do
    it { should be_dirctory }
    it { should be_mode '755' }
    it { should be_owner 'selenium' }
    it { should be_group_into 'selenium' }
  end

  describe file('/var/log/selenium') do
    it { should be_dirctory }
    it { should be_mode '755' }
    it { should be_owner 'selenium' }
    it { should be_group_into 'selenium' }
  end
end