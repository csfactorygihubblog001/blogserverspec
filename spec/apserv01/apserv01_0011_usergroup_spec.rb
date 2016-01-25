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


