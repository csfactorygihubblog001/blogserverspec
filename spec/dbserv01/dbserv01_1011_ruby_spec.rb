require 'spec_helper'


#======================================
# ruby のインストール確認
#======================================
describe command ('============ RUBY インストールの確認 ===============') do

  describe command ('rbenv versions ') do
    its(:stdout) { should match /2.1.7/ }
    its(:stdout) { should match /2.2.0/ }
  end
  describe command ('rbenv version ') do
    its(:stdout) { should match /2.1.7/ }
  end
  describe command ('ruby -v') do
    its(:stdout) { should match /ruby 2.1.7/ }
  end

end

