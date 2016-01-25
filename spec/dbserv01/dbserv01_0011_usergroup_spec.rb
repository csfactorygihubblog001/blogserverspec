require 'spec_helper'
describe user('==================== USERチェック ====================') do

#=====================================================================
# infraグループ存在確認
# GIDの確認
#=====================================================================
  describe group('infra') do
    it { should exist }
    it { should have_gid 1400 }
  end

#=====================================================================
# インフラユーザー存在確認
# プライマリグループ存在確認
# rootユーザーに属する
#=====================================================================
  describe user('infra') do
    it { should exist }
    it { should belong_to_primary_group 'infra' }
    it { should have_uid 1400 }
    it { should have_home_directory '/home/infra' }
    its(:encrypted_password) { should match('$6$infrasolt$a2vFx7QL/cV2Nplcy1AxeRp8Ss34MPTjkbKpu7au.kq.PXshj8K177TUH9Pj5wtG8Y83Ea5Nv8UlvRuBMN5Fu0') }
  end

#=====================================================================
# mysqlグループ存在確認
# GIDの確認
#=====================================================================
  describe group('mysql') do
    it { should exist }
    it { should have_gid 1300 }
  end

#=====================================================================
# mysqlユーザー存在確認
# プライマリグループ存在確認
#=====================================================================
  describe user('mysql') do
    it { should exist }
    it { should belong_to_primary_group 'mysql' }
    it { should have_uid 1300 }
    it { should have_home_directory '/home/mysql' }
    its(:encrypted_password) { should match('$6$mysqlsolt$IeAbOR9NxGYA3Os9p43DRjdGvuTae62i707gWa2/XP/IFVyjHIYsEe/gH5uc15pxwyhAk8kGuRbi6Iinga5wh/') }

  end

end