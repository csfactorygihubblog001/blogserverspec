require 'spec_helper'


describe "============= Apache設定 ============ " do
  describe "httpdインストール確認" do
    describe package('httpd') do
      it { should be_installed }
    end
  end

  describe "ajp設定" do
    describe file('/etc/httpd/conf.d/ajp.conf') do
      it { should be_exist }
      it { should be_file }
      it { should be_mode '644' }
      it { should be_owned_by 'apache' }
      it { should be_grouped_into 'apache' }
      it {should contain('/jenkins/ ajp://localhost:8009/jenkins/').after(/^ProxyPass/)}
      it {should contain('ajp://localhost:8009/jenkins/').after(/^ProxyPassReverse/)}
      it {should contain('/jenkins/ /jenkins/').after(/^ProxyPassReverseCookiePath/)}
    end
  end

  describe "Subversion設定" do
    describe file('/etc/httpd/conf.d/subversion.conf') do
      it { should be_exist }
      it { should be_file }
      it { should be_mode '644' }
      it { should be_owned_by 'apache' }
      it { should be_grouped_into 'apache' }
      its(:content) { should  match /^(\s|\t)*SVNParentPath(\s|\t)*\/var\/opt\/data\/subversion\/repo/ }
      its(:content) { should  match /^(\s|\t)*AuthUserFile(\s|\t)*\/var\/opt\/data\/subversion\/repo\/\.htpasswd/ }
      its(:content) { should  match /^(\s|\t)*Require(\s|\t)*valid-user/ }
    end
    describe file('/var/opt/data/subversion/repo/.htpasswd') do
      it { should be_exist }
      it { should be_file }
      it { should be_mode '644' }
      it { should be_owned_by 'apache' }
      it { should be_grouped_into 'apache' }
      its(:content) { should  match /^user01:.*/ }
      its(:content) { should  match /^user02:.*/ }
      its(:content) { should  match /^user03:.*/ }
    end

  end

  describe "サービスポート設定" do
    describe service('httpd') do
      it{should be_running}
      it{should be_enabled}
    end
    describe port(80) do
      it{should be_listening }
    end
  end
end