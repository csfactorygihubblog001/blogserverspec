require 'spec_helper'

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
end