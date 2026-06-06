# frozen_string_literal: true

require "rbconfig"
require "socket"

module Sys
  class Uname
    class Error < StandardError; end
    UnameStruct = Struct.new(:sysname, :nodename, :release, :version, :machine)

    def self.architecture(*)
      RbConfig::CONFIG.fetch("host_cpu", "unknown")
    end

    def self.machine(*)
      architecture
    end

    def self.nodename(*)
      Socket.gethostname
    end

    def self.sysname(*)
      RbConfig::CONFIG["host_os"].match?(/mingw|mswin/i) ? "Microsoft Windows" : RbConfig::CONFIG["host_os"]
    end

    def self.version(*)
      RbConfig::CONFIG.fetch("host_os", "unknown")
    end

    def self.uname(*)
      UnameStruct.new(sysname, nodename, version, version, machine)
    end
  end
end
