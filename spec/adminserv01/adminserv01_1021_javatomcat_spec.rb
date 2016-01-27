require 'spec_helper'

#=====================================
# JAVA/TOMCATのインストール確認
#=====================================
describe " ================= Javaのインストール確認 ================= " do
  describe command('which java') do
    its(:exit_status) { should eq 0 }
  end
  describe " ================= 起動スクリプトの配置と権限確認 ================= " do
    describe file('/opt/tomcat/bin/startup.sh') do
      it { should be_exist }
      it { should be_owned_by 'tomcat' }
      it { should be_mode '755' }
      it { should be_grouped_into 'tomcat' }
    end
  end
  describe " ================= tmpDirのゴミがないこと確認 ================= " do
    describe command('ls /tmp/apache-tomcat-7.0.65') do
      its(:exit_status) { should_not eq 0}
    end
  end
  describe " ================= setenv.shの配置確認 ================= " do
    describe file('/opt/tomcat/bin/setenv.sh') do
      it { should be_exist }
      it { should be_owned_by 'tomcat' }
      it { should be_mode '755' }
      it { should be_grouped_into 'tomcat' }
    end
  end
  describe " ================= systemdの環境：tomcatenviromentの配置確認 ================= " do
    describe file('/etc/sysconfig/tomcatenviroment') do
      it { should be_exist }
      it { should be_mode '755' }
    end
  end

  describe " ================= /opt/tomcatの確認 ================= " do
    describe file('/opt/tomcat') do
      it { should be_exist }
      it { should be_mode '755' }
    end
  end
  describe " ================= systemctldの確認 ================= " do
    describe file('/usr/lib/systemd/system/tomcat.service') do
      it { should be_exist }
      it { should be_mode '755' }
    end
  end
  describe " ================= /server.xmlの確認 ================= " do
    describe file('/opt/tomcat/conf/server.xml') do
      it { should be_exist }
      it { should be_owned_by 'tomcat' }
      it { should be_mode '755' }
      it { should be_grouped_into 'tomcat' }
      it { should contain('192.168.134.198').after(/Connector port="8080"/) }
    end
  end


  describe " =================   userの編集確認 ================= " do
    describe file('/opt/tomcat/conf/tomcat-users.xml') do
      it { should be_exist }
      it { should be_owned_by 'tomcat' }
      it { should be_mode '755' }
      it { should be_grouped_into 'tomcat' }
      it { should contain('admin123').from(/user username="root"/).to(/manager-gui/) }
      it { should contain('admin123').from(/user username="admin"/).to(/manager-gui/) }
    end
  end


end



