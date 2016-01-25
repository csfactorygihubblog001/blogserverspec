require 'serverspec'
require 'net/ssh'


module Serverspec
  module Type

    class StateMemory < Base

      def initialize(name=nil)
        @name=name
      end

      def state_memory(name=nil)
        StateMemory.new(name)
      end
    end
  end
end

# モジュールを再読み込みする
include Serverspec::Type