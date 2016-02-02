require 'spec_helper'


describe 'firewalldの設定' do
  describe service('firewalld') do
    it {should be_enabled}
    it {should be_running}
  end

  describe package('firewalld') do
    it {should be_installed}
  end

  describe port(80) do
    it {should be_listening}
  end

  describe command('firewall-cmd --list-interface --zone=trusted --permanent') do
    its(:stdout){should match /tun0/}
    its(:stdout){should match /lo/}
  end
  describe command('firewall-cmd --list-interface --zone=trusted') do
    its(:stdout){should match /tun0/}
    its(:stdout){should match /lo/}
  end

  describe command('firewall-cmd  --zone=trusted --query-masquerade --permanent') do
    its(:stdout){should match /^yes/}
  end

  describe command('firewall-cmd  --zone=trusted --query-masquerade') do
    its(:stdout){should match /^yes/}
  end

  describe command('firewall-cmd --list-interface --zone=dmz --permanent') do
    its(:stdout){should match /^enp0s9/}
  end

  describe command('firewall-cmd --list-interface --zone=dmz') do
    its(:stdout){should match /^enp0s9/}
  end

  describe command('firewall-cmd --list-service --zone=dmz --permanent') do
    its(:stdout){should match /^openvpn/}
  end
  describe command('firewall-cmd --list-service --zone=dmz') do
    its(:stdout){should match /^openvpn/}
  end

  describe command('firewall-cmd --list-service --zone=dmz --permanent') do
    its(:stdout){should_not match /.*ssh.*/}
  end
  describe command('firewall-cmd --list-service --zone=dmz') do
    its(:stdout){should_not match /.*ssh.*/}
  end

end