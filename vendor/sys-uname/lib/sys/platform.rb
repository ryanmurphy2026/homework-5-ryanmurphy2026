# frozen_string_literal: true

require "sys/uname"

module Sys
  class Platform
    ARCH = Uname.architecture.to_sym
    OS = File::ALT_SEPARATOR ? :windows : :unix
    IMPL = if File::ALT_SEPARATOR
      :mingw32
    elsif Uname.sysname.match?(/darwin|mac/i)
      :macosx
    elsif Uname.sysname.match?(/linux/i)
      :linux
    else
      :unix
    end

    def self.windows?
      OS == :windows
    end

    def self.unix?
      OS == :unix
    end

    def self.mac?
      IMPL == :macosx
    end

    def self.linux?
      IMPL == :linux
    end

    def self.bsd?
      Uname.sysname.match?(/bsd/i)
    end
  end
end
