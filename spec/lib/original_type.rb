require 'serverspec'
require 'net/ssh'


module Serverspec
  module Type
    # Serverspec::Type モジュールに Mount クラスを定義
    class OsInfo < Base

      def initialize(name=nil)
        @name=name
      end

      #CPUの個数を取得
      def cpu_count
        Specinfra::Runner.run_command("cat /proc/cpuinfo|grep processor|wc -l").stdout.strip.to_i
      end

      #トータルのメモリサイズ(２Gでも実際はハードウェア分などに取られて少なくなる)
      def mem_total_range_mg?(min, max)
        val=Specinfra::Runner.run_command("cat /proc/meminfo|grep MemTotal: |sed -e 's/MemTotal://' -e 's/ //g' -e 's/kB//'").stdout.strip.to_i
        (min * 1000) <= val && val <= (max * 1000)
      end

    end

    def os_info(name=nil)
      OsInfo.new(name)
    end
  end
end

module Serverspec
  module Type
    # Serverspec::Type モジュールに Mount クラスを定義
    class Network < Base

      def initialize
      end

      #DNSサーバの設定値
      def dns_client?(*ips)
        dnss = Specinfra::Runner.run_command("cat /etc/resolv.conf|grep nameserver|sed -e 's/nameserver//g' -e 's/ //g'").stdout
        ips.each do |v|
          if dnss !~ /#{v}/ then
            return false
          end
        end
        true
      end
    end

    def http_connect?(url)
      res = Specinfra::Runner.run_command("wget -nv #{url}|grep -c '200 OK'").stdout.strip
      res == /200 OK/
    end

    def bind_ip_and_port?(ipport)
      res = Specinfra::Runner.run_command("wget -nv #{url}|grep -c '200 OK'").stdout.strip
      res == /200 OK/
    end

    def network
      Network.new()
    end
  end
end

module Serverspec
  module Type
    class CommandExt < Base
    def initialize(name=nil)
      @name=name
    end
      def sudo_exec?(user)
        res = Specinfra::Runner.run_command("sudo - #{user};which #{@name}").exit_status


      end

      def command_ext(name=nil)
        CommandExt.new(name)
      end

    end
  end


=begin
  module Serverspec
    module Type
      # Serverspec::Type モジュールに Mount クラスを定義
      class Apache < Base


      end
    end
  end

  module Serverspec
    module Type
      class Tomcat < Base


      end
    end
  end

  module Serverspec
    module Type
      class Ntp < Base


      end
    end
  end
  module Serverspec
    module Type
      class Nfs < Base


      end
    end
  end

  module Serverspec
    module Type
      class OepnVpn < Base


      end
    end
  end
=end
end


# モジュールを再読み込みする
  include Serverspec::Type