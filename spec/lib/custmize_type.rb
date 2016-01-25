require 'serverspec'
require 'net/ssh'


#Packegeクラスをオープンクラスして
#追記
module Serverspec::Type
  class Package < Base
    def updates?
      Specinfra::Runner.run_command('yum list updates|grep "更新したパッケージ"|wc -l').stdout.strip.to_i == 0
    end

    def simple_copy_installed?

      Specinfra::Runner.run_command("which nmon").exit_status.to_i == 0
    end
  end


end
module Serverspec::Type
  class User < Base
    def plainpassword?
      @runner('yum list updates|grep "更新したパッケージ"|wc -l').stdout.strip.to_i == 0
    end
  end
end

# モジュールを再読み込みする
#include Serverspec::Type