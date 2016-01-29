require 'spec_helper'
describe "============= openvpn設定 ============ " do
  describe "openvpnインストール確認" do
    describe package('openvpn') do
      it { should be_installed }
    end
    describe package('easy-rsa') do
      it { should be_installed }
    end
  end


  describe "ディレクトリ/ファイルチェック" do
    describe file('/etc/openvpn/easy-rsa') do
      it { should be_exist }
      it { should be_directory }
      it { should be_mode '700' }
      it { should be_owned_by 'root' }
      it { should be_grouped_into 'root' }
    end

    describe file('/var/log/openvpn') do
      it { should be_exist }
      it { should be_directory }
      it { should be_mode '660' }
      it { should be_owned_by 'root' }
      it { should be_grouped_into 'root' }
    end

    describe file('/etc/openvpn/server.conf') do
      it { should be_exist }
      it { should be_file }
      its(:content) { should match /^server\s+10\.99\.0\.0\s+255\.255\.255\.0/ }
      its(:content) { should match /^push.*192\.168\.102\.0\s+255\.255\.255\.0/ }
      its(:content) { should match /^port 1194$/ }
      its(:content) { should match /^proto udp$/ }
    end

    describe file('/etc/openvpn/easy-rsa/vars') do
      it { should be_exist }
      it { should be_file }
      its(:content) { should match /^export KEY_COUNTRY="JP"$/ }
      its(:content) { should match /^export KEY_PROVINCE="Fukuoka"$/ }
      its(:content) { should match /^export KEY_CITY="FukuokashiChuouku"$/ }
      its(:content) { should match /^export KEY_ORG="CsFactory"$/ }
      its(:content) { should match /^export KEY_EMAIL="uemura@cs-fact.com"$/ }
      its(:content) { should match /^export KEY_OU="NonUnitwww"$/ }
      its(:content) { should match /^export KEY_SIZE=2048$/ }
      its(:content) { should match /^export CA_EXPIRE=3650$/ }
      its(:content) { should match /^export KEY_EXPIRE=3650$/ }
    end

    describe '作成したサーバ証明書/キー/CA証明書/失効リストの配置確認' do
      describe file('/etc/openvpn/ca.crt') do
        it { should be_exist }
        it { should be_file }
        it { should be_mode '500' }
        it { should be_owned_by 'root' }
        it { should be_grouped_into 'root' }
      end
      describe file('/etc/openvpn/server.crt') do
        it { should be_exist }
        it { should be_file }
        it { should be_owned_by 'root' }
        it { should be_grouped_into 'root' }
      end
      describe file('/etc/openvpn/dh2048.pem') do
        it { should be_exist }
        it { should be_file }
        it { should be_owned_by 'root' }
        it { should be_grouped_into 'root' }
      end
      describe file('/etc/openvpn/server.key') do
        it { should be_exist }
        it { should be_file }
        it { should be_owned_by 'root' }
        it { should be_grouped_into 'root' }
      end
      describe file('/etc/openvpn/index.txt') do
        it { should be_exist }
        it { should be_file }
        it { should be_owned_by 'root' }
        it { should be_grouped_into 'root' }
      end
      describe file('/etc/openvpn/crl.pem') do
        it { should be_exist }
        it { should be_file }
        it { should be_owned_by 'root' }
        it { should be_grouped_into 'root' }
      end
    end
    describe '作成したクライアント証明書を配置' do
      describe file('/var/opt/data/nfs/output/uemura.tar.gz') do
        it { should be_exist }
        it { should be_file }
      end
      describe file('/var/opt/data/nfs/output/user01.tar.gz') do
        it { should be_exist }
        it { should be_file }
      end
      describe file('/var/opt/data/nfs/output/user02.tar.gz') do
        it { should be_exist }
        it { should be_file }
      end
    end
    describe '完了ファイルを作成' do
      describe file('/etc/openvpn/easy-rsa/commit') do
        it { should be_exist }
        it { should be_file }
      end
    end
  end
  describe 'サービスの確認' do
    describe service('openvpn@server') do
      it { should be_enabled }
      it { should be_running}
    end
    describe port(1194) do
      it { should be_listening }

    end
  end


end