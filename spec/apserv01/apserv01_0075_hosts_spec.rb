require 'spec_helper'
describe "============= hostsで名前解決できるかpingが通るか ============= " do
  describe host('manageterm') do
    it { should be_resolvable.by('hosts')}
    it { should be_reachable}
    its(:ipaddress){should eq '192.168.134.195'}
  end

  describe host('adminserv01') do
    it { should be_resolvable.by('hosts')}
    it { should be_reachable}
    its(:ipaddress){should eq '192.168.134.198'}
  end
  describe host('apserv01') do
    it { should be_resolvable.by('hosts')}
    it { should be_reachable}
    its(:ipaddress){should match /127.0.0.1/}
    its(:ipaddress){should match /192.168.134.196/}
  end
  describe host('dbserv01') do
    it { should be_resolvable.by('hosts')}
    it { should be_reachable}
    its(:ipaddress){should eq '192.168.134.197'}
  end

end
