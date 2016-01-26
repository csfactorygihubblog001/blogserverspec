require 'spec_helper'

describe "=========== NFS ==============" do
  describe file ('/etc/exports') do
    it { should contain '/var/opt/data/nfs 192.168.134.0/255.255.255.0(rw,no_root_squash)'}
  end

end