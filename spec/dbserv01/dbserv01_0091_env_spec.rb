require 'spec_helper'
describe 'profile_init.shの存在確認' do
  describe file('/etc/profile.d/profile_init.sh') do
    it {should be_exist}
  end
end