require 'spec_helper'
describe ' ============= ローカルからadminserv01へのファイルコピー =============== ' do
  describe ' Java関連 ' do
    describe file('/var/opt/data/nfs/java/installer') do
      it { should be_directory }
      it { should be_mode '755' }
      it { should be_owned_by 'infra' }
      it { should be_grouped_into 'infra' }
    end
    describe file('/var/opt/data/nfs/java/installer/jdk-7u79-linux-x64.rpm') do
      it { should be_file }
      it { should be_mode '755' }
      it { should be_owned_by 'infra' }
      it { should be_grouped_into 'infra' }
    end
    describe file('/var/opt/data/nfs/java/settings') do
      it { should be_directory }
      it { should be_mode '755' }
      it { should be_owned_by 'infra' }
      it { should be_grouped_into 'infra' }
    end
  end


  describe ' TOMCAT関連 ' do
    describe file('/var/opt/data/nfs/tomcat/installer') do
      it { should be_directory }
      it { should be_mode '755' }
      it { should be_owned_by 'infra' }
      it { should be_grouped_into 'infra' }
    end
    describe file('/var/opt/data/nfs/tomcat/installer/apache-tomcat-7.0.65.tar.gz') do
      it { should be_file }
      it { should be_mode '755' }
      it { should be_owned_by 'infra' }
      it { should be_grouped_into 'infra' }
    end

    describe file('/var/opt/data/nfs/tomcat/settings') do
      it { should be_directory }
      it { should be_mode '755' }
      it { should be_owned_by 'infra' }
      it { should be_grouped_into 'infra' }
    end
    describe file('/var/opt/data/nfs/tomcat/settings/server.xml') do
      it { should be_file }
      it { should be_mode '755' }
      it { should be_owned_by 'infra' }
      it { should be_grouped_into 'infra' }
    end
    describe file('/var/opt/data/nfs/tomcat/settings/setenv.sh') do
      it { should be_file }
      it { should be_mode '755' }
      it { should be_owned_by 'infra' }
      it { should be_grouped_into 'infra' }
    end
    describe file('/var/opt/data/nfs/tomcat/settings/tomcat_systemd.template') do
      it { should be_file }
      it { should be_mode '755' }
      it { should be_owned_by 'infra' }
      it { should be_grouped_into 'infra' }
    end
    describe file('/var/opt/data/nfs/tomcat/settings/tomcat-users.xml') do
      it { should be_file }
      it { should be_mode '755' }
      it { should be_owned_by 'infra' }
      it { should be_grouped_into 'infra' }
    end
    describe file('/var/opt/data/nfs/tomcat/settings/tomcatenviroment') do
      it { should be_file }
      it { should be_mode '755' }
      it { should be_owned_by 'infra' }
      it { should be_grouped_into 'infra' }
    end

    describe file('/var/opt/data/nfs/tomcat/firewalld') do
      it { should be_directory }
      it { should be_mode '755' }
      it { should be_owned_by 'infra' }
      it { should be_grouped_into 'infra' }
    end
    describe file('/var/opt/data/nfs/tomcat/firewalld/tomcat.xml') do
      it { should be_file }
      it { should be_mode '755' }
      it { should be_owned_by 'infra' }
      it { should be_grouped_into 'infra' }
    end

  end

  describe ' Selenium関連 ' do
    describe file('/var/opt/data/nfs/selenium/installer') do
      it { should be_directory }
      it { should be_mode '755' }
      it { should be_owned_by 'infra' }
      it { should be_grouped_into 'infra' }
    end
    describe file('/var/opt/data/nfs/selenium/installer/selenium-server-standalone-2.48.2.jar') do
      it { should be_file }
      it { should be_mode '755' }
      it { should be_owned_by 'infra' }
      it { should be_grouped_into 'infra' }
    end

    describe file('/var/opt/data/nfs/selenium/settings') do
      it { should be_directory }
      it { should be_mode '755' }
      it { should be_owned_by 'infra' }
      it { should be_grouped_into 'infra' }
    end

    describe file('/var/opt/data/nfs/selenium/settings/node.json') do
      it { should be_file }
      it { should be_mode '755' }
      it { should be_owned_by 'infra' }
      it { should be_grouped_into 'infra' }
    end
    describe file('/var/opt/data/nfs/selenium/settings/selenium_systemd.template_adminserv01') do
      it { should be_file }
      it { should be_mode '755' }
      it { should be_owned_by 'infra' }
      it { should be_grouped_into 'infra' }
    end
    describe file('/var/opt/data/nfs/selenium/settings/selenium.sh') do
      it { should be_file }
      it { should be_mode '755' }
      it { should be_owned_by 'infra' }
      it { should be_grouped_into 'infra' }
    end

    describe file('/var/opt/data/nfs/selenium/firewalld') do
      it { should be_directory }
      it { should be_mode '755' }
      it { should be_owned_by 'infra' }
      it { should be_grouped_into 'infra' }
    end
    describe file('/var/opt/data/nfs/selenium/firewalld/selenium.xml') do
      it { should be_file }
      it { should be_mode '755' }
      it { should be_owned_by 'infra' }
      it { should be_grouped_into 'infra' }
    end

  end

  describe ' Jenkins関連 ' do
    describe file('/var/opt/data/nfs/jenkins_mvn/installer') do
      it { should be_directory }
      it { should be_mode '755' }
      it { should be_owned_by 'infra' }
      it { should be_grouped_into 'infra' }
    end
    describe file('/var/opt/data/nfs/jenkins_mvn/installer/apache-maven-3.3.3-bin.tar.gz') do
      it { should be_file }
      it { should be_mode '755' }
      it { should be_owned_by 'infra' }
      it { should be_grouped_into 'infra' }
    end
    describe file('/var/opt/data/nfs/jenkins_mvn/installer/jenkins.war') do
      it { should be_file }
      it { should be_mode '755' }
      it { should be_owned_by 'infra' }
      it { should be_grouped_into 'infra' }
    end
    describe file('/var/opt/data/nfs/jenkins_mvn/settings') do
      it { should be_directory }
      it { should be_mode '755' }
      it { should be_owned_by 'infra' }
      it { should be_grouped_into 'infra' }
    end


  end

  describe ' nfs関連 ' do
    describe file('/var/opt/data/nfs/nfs/installer') do
      it { should be_directory }
      it { should be_mode '755' }
      it { should be_owned_by 'infra' }
      it { should be_grouped_into 'infra' }
    end
    describe file('/var/opt/data/nfs/nfs/settings') do
      it { should be_directory }
      it { should be_mode '755' }
      it { should be_owned_by 'infra' }
      it { should be_grouped_into 'infra' }
    end
    describe file('/var/opt/data/nfs/nfs/settings/exports') do
      it { should be_file }
      it { should be_mode '755' }
      it { should be_owned_by 'infra' }
      it { should be_grouped_into 'infra' }
    end
  end

  describe ' os関連 ' do
    describe file('/var/opt/data/nfs/os/installer') do
      it { should be_directory }
      it { should be_mode '755' }
      it { should be_owned_by 'infra' }
      it { should be_grouped_into 'infra' }
    end
    describe file('/var/opt/data/nfs/os/settings') do
      it { should be_directory }
      it { should be_mode '755' }
      it { should be_owned_by 'infra' }
      it { should be_grouped_into 'infra' }
    end
    describe file('/var/opt/data/nfs/os/installer/centos7.tar.gz') do
      it { should be_file }
      it { should be_mode '755' }
      it { should be_owned_by 'infra' }
      it { should be_grouped_into 'infra' }
    end
    describe file('/var/opt/data/nfs/os/settings/profile_init.sh') do
      it { should be_file }
      it { should be_mode '755' }
      it { should be_owned_by 'infra' }
      it { should be_grouped_into 'infra' }
    end
    describe file('/var/opt/data/nfs/os/settings/resolv.conf') do
      it { should be_file }
      it { should be_mode '755' }
      it { should be_owned_by 'infra' }
      it { should be_grouped_into 'infra' }
    end

  end

  describe ' apache関連 ' do
    describe file('/var/opt/data/nfs/apache/installer') do
      it { should be_directory }
      it { should be_mode '755' }
      it { should be_owned_by 'infra' }
      it { should be_grouped_into 'infra' }
    end
    describe file('/var/opt/data/nfs/apache/settings') do
      it { should be_directory }
      it { should be_mode '755' }
      it { should be_owned_by 'infra' }
      it { should be_grouped_into 'infra' }
    end
    describe file('/var/opt/data/nfs/apache/settings/.ssl.conf_dev_apserv01') do
      it { should be_file }
      it { should be_mode '755' }
      it { should be_owned_by 'infra' }
      it { should be_grouped_into 'infra' }
    end
    describe file('/var/opt/data/nfs/apache/settings/ajp.conf_adminserv01') do
      it { should be_file }
      it { should be_mode '755' }
      it { should be_owned_by 'infra' }
      it { should be_grouped_into 'infra' }
    end
    describe file('/var/opt/data/nfs/apache/settings/ajp.conf_apserv01') do
      it { should be_file }
      it { should be_mode '755' }
      it { should be_owned_by 'infra' }
      it { should be_grouped_into 'infra' }
    end
    describe file('/var/opt/data/nfs/apache/settings/server_cert.pem_apserv01') do
      it { should be_file }
      it { should be_mode '755' }
      it { should be_owned_by 'infra' }
      it { should be_grouped_into 'infra' }
    end
    describe file('/var/opt/data/nfs/apache/settings/server_key.pem.nopass_apserv01') do
      it { should be_file }
      it { should be_mode '755' }
      it { should be_owned_by 'infra' }
      it { should be_grouped_into 'infra' }
    end
    describe file('/var/opt/data/nfs/apache/settings/ssl.conf_apserv01') do
      it { should be_file }
      it { should be_mode '755' }
      it { should be_owned_by 'infra' }
      it { should be_grouped_into 'infra' }
    end
    describe file('/var/opt/data/nfs/apache/settings/subversion.conf_adminserv01') do
      it { should be_file }
      it { should be_mode '755' }
      it { should be_owned_by 'infra' }
      it { should be_grouped_into 'infra' }
    end
  end

  describe ' mariadb(mysql)関連 ' do
    describe file('/var/opt/data/nfs/mysql/installer') do
      it { should be_directory }
      it { should be_mode '755' }
      it { should be_owned_by 'infra' }
      it { should be_grouped_into 'infra' }
    end
    describe file('/var/opt/data/nfs/mysql/settings') do
      it { should be_directory }
      it { should be_mode '755' }
      it { should be_owned_by 'infra' }
      it { should be_grouped_into 'infra' }
    end
    describe file('/var/opt/data/nfs/mysql/settings/init.exp') do
      it { should be_file }
      it { should be_mode '755' }
      it { should be_owned_by 'infra' }
      it { should be_grouped_into 'infra' }
    end
    describe file('/var/opt/data/nfs/mysql/settings/my.cnf') do
      it { should be_file }
      it { should be_mode '755' }
      it { should be_owned_by 'infra' }
      it { should be_grouped_into 'infra' }
    end

  end

  describe ' openvpn関連 ' do
    describe file('/var/opt/data/nfs/openvpn/installer') do
      it { should be_directory }
      it { should be_mode '755' }
      it { should be_owned_by 'infra' }
      it { should be_grouped_into 'infra' }
    end
    describe file('/var/opt/data/nfs/openvpn/settings') do
      it { should be_directory }
      it { should be_mode '755' }
      it { should be_owned_by 'infra' }
      it { should be_grouped_into 'infra' }
    end
    describe file('/var/opt/data/nfs/openvpn/settings/exec_ca.exp') do
      it { should be_file }
      it { should be_mode '755' }
      it { should be_owned_by 'infra' }
      it { should be_grouped_into 'infra' }
    end
    describe file('/var/opt/data/nfs/openvpn/settings/exec_client.exp') do
      it { should be_file }
      it { should be_mode '755' }
      it { should be_owned_by 'infra' }
      it { should be_grouped_into 'infra' }
    end
    describe file('/var/opt/data/nfs/openvpn/settings/exec_server.exp') do
      it { should be_file }
      it { should be_mode '755' }
      it { should be_owned_by 'infra' }
      it { should be_grouped_into 'infra' }
    end
    describe file('/var/opt/data/nfs/openvpn/settings/server.conf') do
      it { should be_file }
      it { should be_mode '755' }
      it { should be_owned_by 'infra' }
      it { should be_grouped_into 'infra' }
    end
    describe file('/var/opt/data/nfs/openvpn/settings/vars') do
      it { should be_file }
      it { should be_mode '755' }
      it { should be_owned_by 'infra' }
      it { should be_grouped_into 'infra' }
    end

    describe ' 出力ディレクトリ ' do
      describe file('/var/opt/data/nfs/output') do
        it { should be_directory }
        it { should be_mode '755' }
        it { should be_owned_by 'infra' }
        it { should be_grouped_into 'infra' }
      end
    end
  end
end