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

