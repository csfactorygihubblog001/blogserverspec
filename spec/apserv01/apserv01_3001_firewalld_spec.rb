require 'spec_helper'
require 'lib/firewall'


describe 'firewalldの設定' do
  describe package('firewalld') do
    it {should be_installed}
  end


  describe service('firewalld') do
    it {should be_enabled}
    it {should be_running}
  end

   describe firewall ('dmz') do
    it {should  be_interface_both 'enp0s9'}
    it {should_not  be_service_both 'ssh'}
    it {should  be_service_both 'http'}
    it {should  be_service_both 'https'}
  end
  describe firewall ('internal') do
    it {should  be_interface_both 'enp0s8'}
    it {should_not  be_service_both 'dhcpv6-client'}
    it {should_not  be_service_both 'ipp-client'}
    it {should_not  be_service_both 'mdns'}
    it {should_not  be_service_both 'samba-client'}
    it {should  be_service_both 'ssh'}
    it {should  be_service_both 'http'}
    it {should  be_service_both 'https'}
    it {should  be_service_both 'tomcat'}
    it {should  be_service_both 'tomcatajp'}
    it {should  be_service_both 'ntp'}
  end
end
