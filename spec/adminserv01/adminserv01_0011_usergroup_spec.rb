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
# apacheグループ存在確認
# GIDの確認
#=====================================================================
  describe group('apache') do
    it { should exist }
    it { should have_gid 1100 }
  end
#=====================================================================
# apacheユーザー存在確認
# プライマリグループ存在確認
#=====================================================================
  describe user('apache') do
    it { should exist }
    it { should belong_to_primary_group 'apache' }
    it { should have_uid 1100 }
    it { should have_home_directory '/home/apache' }
    its(:encrypted_password) { should match('$6$apachesolt$PnTyYlBO7ZAmPmXNBxAgWj03udlCNxqOqWvfik.fM3A84UTG.Un0cWUaXEl2vT2Acme.lMsPVRapEOZ9MhWYr0') }
  end
#=====================================================================
# tomcatグループ存在確認
# GIDの確認
#=====================================================================
  describe group('tomcat') do
    it { should exist }
    it { should have_gid 1200 }
  end
#=====================================================================
# tomcatユーザー存在確認
# プライマリグループ存在確認
#=====================================================================
  describe user('tomcat') do
    it { should exist }
    it { should belong_to_primary_group 'tomcat' }
    it { should have_uid 1200 }
    it { should have_home_directory '/home/tomcat' }
    its(:encrypted_password) { should match('$6$tomcatsolt$Dz8QThSePXH5WZ0EjLQbUA8pZJrgIl4.2qsflSWkn1gV.RqD84vPT0.tdThOEn1VyowWJBsTgm2rmv5oJixDJ1') }
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

#=====================================================================
# seleniumグループ存在確認
# GIDの確認
#=====================================================================
  describe group('selenium') do
    it { should exist }
    it { should have_gid 1600 }
  end

#=====================================================================
# seleniumユーザー存在確認
# プライマリグループ存在確認
#=====================================================================
  describe user('selenium') do
    it { should exist }
    it { should belong_to_primary_group 'selenium' }
    it { should have_uid 1600 }
    it { should have_home_directory '/home/selenium' }
    its(:encrypted_password) { should match('$6$seleniumsolt$fl7ibc.Xf/.xnbIFqIXuGA3rtddYdZiUILqVvJO06cjGXy.HmpDh1LjXZYLKqzZymjn1GqmQkz2ndc8lfbfTz/') }
  end
end
