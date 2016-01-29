require 'spec_helper'
describe "============= mysql設定 ============ " do
  describe "ファイル/DIRチェック" do
    describe file('/etc/my.cnf') do
      it { should be_exist }
      it { should be_file }
      it { should be_owned_by 'mysql' }
      it { should be_grouped_into 'mysql' }
      it { should be_mode '644' }
      its (:content) { should match /^datadir=\/var\/opt\/data\/mysql$/ }
      its (:content) { should match /^socket=\/var\/opt\/data\/mysql\/mysql\.sock$/ }
      its (:content) { should match /^character-set-server=utf8$/ }
      its (:content) { should match /^default-storage-engine=InnoDB$/ }

    end
    describe file('/var/opt/data/mysql/mysql.sock') do
      it { should be_exist }
      it { should be_owned_by 'mysql' }
      it { should be_grouped_into 'mysql' }
    end

    describe file('/var/lib/mysql/mysql.sock') do
      it { should be_exist }
      it { should be_linked_to '/var/opt/data/mysql/mysql.sock' }

    end

  end
  describe "サービス/ポート" do
    describe package('mariadb-server') do
      it { should be_installed }
    end
    describe package('mariadb') do
      it { should be_installed }
    end
    describe package('mariadb-libs') do
      it { should be_installed }
    end

    describe service('mariadb') do
      it { should be_enabled }
      it { should be_running }
    end
    describe port(3306) do
      it { should be_listening }
    end
    describe command("mysql -u root -ppassword  mysql -e 'show databases;'") do
      its(:exit_status) { should eq 0 }
    end
  end

end