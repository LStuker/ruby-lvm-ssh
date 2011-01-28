module LVM
  module Wrapper
    module Reporting
      module Constants
        SEPERATOR       = '^'
        BASE_ARGUMENTS  = "--separator=#{SEPERATOR} --noheadings --nosuffix --units=b --unbuffered --options %s"
        DEFAULT_COMMAND = '/usr/bin/sudo /sbin/lvm'
        EMPTY           = '-'
      end
    end
  end
end