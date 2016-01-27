require 'spec_helper'
describe " ================ Jenkins インストール設定確認 ===================" do
  describe file('/opt/tomcat/webapps/jenkins.war') do
    it {should be_exist}
    it {should be_file}
  end
  describe command('wget -q http://192.168.134.198:8080/jenkins') do
    its(:exit_status){ should eq 0 }
  end

  describe file('/opt/maven') do
    it {should be_exist}
    it {should be_directory}
  end
  describe command('mvn -version') do
    its(:exit_status){ should eq 0 }
  end

end