require 'lvm/wrapper'
require 'lvm/wrapper/pvs'

module LVM
  module Wrapper
    module PVremove

      # Create a LVM Physical Volume out of a device
      # if fdisk does not find a partition on the disk and
      # if pvscan does not find an existing physical volume label
      def pv_remove(pvpath)
        External.cmd(@server, "#{@command} pvremoce #{pvpath}")
      end


    end # module PVremove
  end # module Wrapper
end # module LVM
