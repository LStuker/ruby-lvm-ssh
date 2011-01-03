module LVM
  module Wrapper
    module Reporting
      module Constants
        SEPERATOR = '^'
        BASE_ARGUMENTS = "--separator=#{SEPERATOR} --noheadings --nosuffix --units=b --unbuffered --options %s"
        EMPTY = '-'
      end
    end
  end
end