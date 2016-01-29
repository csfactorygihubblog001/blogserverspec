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
=begin
      it {should contain('/wd/ ajp://localhost:8009/wd/').after(/^ProxyPass/)}
      it {should contain('ajp://localhost:8009/wd/').after(/^ProxyPassReverse/)}
      it {should contain('/wd/ /wd/').after(/^ProxyPassReverseCookiePath/)}
=end
      its(:content) {should match /^ProxyPass(\s|\t)*\/wd\/(\s|\t)*ajp:\/\/localhost:8009\/wd\//}
      its(:content) {should match /^ProxyPassReverse(\s|\t)*\/wd\/(\s|\t)*ajp:\/\/localhost:8009\/wd\//}
      its(:content) {should match /^ProxyPassReverseCookiePath(\s|\t)*\/wd\/(\s|\t)*\/wd\//}
    end
  end

  describe "サーバ証明書/秘密鍵/ssLの設定ファイル" do
    describe file('/etc/httpd/conf.d/server_key.pem.nopass') do
      it { should be_exist }
      it { should be_file }
      it { should be_mode '644' }
      it { should be_owned_by 'apache' }
      it { should be_grouped_into 'apache' }
    end
    describe file('/etc/httpd/conf.d/ssl.conf') do
      it { should be_exist }
      it { should be_file }
      it { should be_mode '644' }
      it { should be_owned_by 'apache' }
      it { should be_grouped_into 'apache' }
      it {should contain('/etc/httpd/conf.d/server_cert.pem').after(/^SSLCertificateFile/)}
      it {should contain('/etc/httpd/conf.d/server_key.pem.nopass').after(/^SSLCertificateKeyFile/)}
      it {should contain('require').after(/^#SSLVerifyClient/)}
    end
    describe file('/etc/httpd/conf.d/server_cert.pem') do
      it { should be_exist }
      it { should be_file }
      it { should be_mode '644' }
      it { should be_owned_by 'apache' }
      it { should be_grouped_into 'apache' }
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