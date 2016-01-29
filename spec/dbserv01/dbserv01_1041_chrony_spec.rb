require 'spec_helper'


describe "============ NTPインストール確認 ============" do
  describe package('chronyd') do
    it { should be_installed }
  end

  describe file('/etc/chrony.conf') do
    its(:content) {should match('server apserv01 iburst')}
  end

end