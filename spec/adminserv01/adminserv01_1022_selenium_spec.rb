require 'spec_helper'

#=====================================
# Seleniumのインストール/設定確認
#=====================================
describe " ================= Javaのインストール確認 ================= " do
  describe command('which java') do
    its(:exit_status) { should eq 0 }
  end
  describe " ================= 起動スクリプトの配置と権限確認 ================= " do
    describe file('/opt/selenium/selenium.sh') do
      it { should be_exist }
      it { should be_file }
      it { should be_owned_by 'selenium' }
      it { should be_mode '755' }
    end
  end
  describe " ================= /opt/seleniumの確認 ================= " do
    describe file('/opt/selenium') do
      it { should be_exist }
      it { should be_directory }
      it { should be_mode '755' }
      it { should be_owned_by 'selenium' }
    end
  end
  describe " ================= systemctldの確認 ================= " do
    describe file('/opt/selenium/selenium-server-standalone-2.48.2.jar') do
      it { should be_exist }
      it { should be_file }
      it { should be_mode '755' }
      it { should be_owned_by 'selenium' }
    end
  end
  describe " ================= systemctldの確認 ================= " do
    describe file('/opt/selenium/selenium.sh') do
      it { should be_exist }
      it { should be_file }
      it { should be_mode '755' }
      it { should be_owned_by 'selenium' }
    end
  end

  describe " ================= systemctldの設定ファイル配置確認 ================= " do
    describe file('/usr/lib/systemd/system/selenium.service') do
      it { should be_exist }
      it { should be_file }
      it { should be_mode '755' }
      it { should be_owned_by 'root' }
    end
  end
  describe " ================= selenium(HUB)サービスの起動 ================= " do
    describe service('selenium') do
      it { should be_enabled }
      it { should be_running }
    end
  end
  describe " ================= selenium(HUB)ポートオープン確認 ================= " do
    describe port('5555') do
      it { should be_listening.with('tcp') }
    end
  end

end



