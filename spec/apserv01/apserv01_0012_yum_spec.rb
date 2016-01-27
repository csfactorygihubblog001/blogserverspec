require 'spec_helper'

describe ('================ YUM インストール確認 ================') do
  describe package('vim-enhanced') do
    it { should be_installed }
  end
  describe package('openssl') do
    it { should be_installed }
  end
  describe package('httpd') do
    it { should be_installed }
  end
  describe package('wget') do
    it { should be_installed }
  end
  describe package('unzip') do
    it { should be_installed }
  end
  describe package('gcc') do
    it { should be_installed }
  end
  describe package('git') do
    it { should be_installed }
  end
  describe package('libffi-devel') do
    it { should be_installed }
  end
  describe package('bind-utils') do
    it { should be_installed }
  end
  describe package('net-tools') do
    it { should be_installed }
  end
  describe package('mod_ssl') do
    it { should be_installed }
  end
  describe package('man-pages-ja') do
    it { should be_installed }
  end
  describe package('chrony') do
    it { should be_installed }
  end
  describe package('openssl-devel') do
    it { should be_installed }
  end
  describe package('readline-devel') do
    it { should be_installed }
  end
  describe package('zlib-devel') do
    it { should be_installed }
  end
  describe package('psmisc') do
    it { should be_installed }
  end
  describe package('nfs-utils') do
    it { should be_installed }
  end
  describe package('mlocate') do
    it { should be_installed }
  end
  describe package('mariadb') do
    it { should be_installed }
  end

  describe package('expect') do
    it { should be_installed }
  end
  describe package('libselinux-python') do
    it { should be_installed }
  end
  describe package('isof') do
    it { should be_installed }
  end

end
