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

  describe firewall ('block') do
    it {should  be_interface_both 'enp0s9'}
  end
  describe firewall ('internal') do
    it {should  be_interface_both 'enp0s8'}
    it {should_not  be_service_both 'dhcpv6-client'}
    it {should_not  be_service_both 'ipp-client'}
    it {should_not  be_service_both 'mdns'}
    it {should_not  be_service_both 'samba-client'}
    it {should  be_service_both 'ssh'}
    it {should  be_service_both 'mysql'}
  end
end
