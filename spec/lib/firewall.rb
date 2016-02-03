require 'serverspec'
require 'net/ssh'


module Serverspec
  module Type

    class Firewall < Base
      @base=nil
      @base_permanent=nil

      def initialize(zone=nil)
        super(zone)
        @base="firewall-cmd --zone=#{@name} "
        @base_permanent="firewall-cmd --permanent --zone=#{@name} "
      end

      def interface?(ifs)
        @runner.run_command("#{@base} --query-interface=#{ifs}").stdout.strip == 'yes'
      end

      def interface_permanent?(ifs)
        @runner.run_command("#{@base_permanent} --query-interface=#{ifs}").stdout.strip == 'yes'
      end
      def interface_both?(ifs)
        first_ret = @runner.run_command("#{@base} --query-interface=#{ifs}").stdout.strip == 'yes'
        !first_ret ? first_ret : @runner.run_command("#{@base_permanent} --query-interface=#{ifs}").stdout.strip == 'yes'
      end

      def masquerade?
        @runner.run_command("#{@base} --query-masquerade").stdout.strip == 'yes'
      end

      def masquerade_permanent?
        @runner.run_command("#{@base_permanent} --query-masquerade").stdout.strip == 'yes'
      end

      def masquerade_both?
        first_ret=@runner.run_command("#{@base} --query-masquerade").stdout.strip == 'yes'
        !first_ret ? first_ret : @runner.run_command("#{@base_permanent} --query-masquerade").stdout.strip == 'yes'
      end

      def service?(service)
        @runner.run_command("#{@base} --query-service=#{service}").stdout.strip.to_s == 'yes'
      end

      def service_permanent?(service)
        @runner.run_command("#{@base_permanent} --query-service=#{service}").stdout.strip.to_s == 'yes'
      end
      def service_both?(service)
        first_ret=@runner.run_command("#{@base} --query-service=#{service}").stdout.strip.to_s == 'yes'
        !first_ret ? first_ret : @runner.run_command("#{@base_permanent} --query-service=#{service}").stdout.strip.to_s == 'yes'
      end

    end
    def firewall(zone=nil)
      Firewall.new(zone)
    end
  end
end
# モジュールを再読み込みする
include Serverspec::Type