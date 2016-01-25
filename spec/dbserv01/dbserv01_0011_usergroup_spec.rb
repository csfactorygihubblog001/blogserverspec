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
#  it { should belong_to_group 'root' }
  it { should have_uid 1400 }
end


