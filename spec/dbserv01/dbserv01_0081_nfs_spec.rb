require 'spec_helper'
describe " ==================== " do

  describe file('/var/ot/data/nfs') do
    it { be_mounted.with(:type => 'nfs')}
  end
end