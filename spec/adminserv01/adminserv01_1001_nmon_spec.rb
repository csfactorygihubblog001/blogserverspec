require 'spec_helper'
describe 'nmonの存在確認' do
  describe file('/bin/nmon') do
    it {should be_exist}
  end
end