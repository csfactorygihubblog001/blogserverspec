require 'spec_helper'


describe "============ NTPインストール確認 ============" do

  describe service('chronyd') do
    it {should be_running}
    it {should be_enabled}
  end
  describe port('123') do
    it {should be_listening}
  end
  describe file('/etc/chrony.conf') do
    its(:content) {should match(/server 0.centos.pool.ntp.org iburst/)}
  end

end