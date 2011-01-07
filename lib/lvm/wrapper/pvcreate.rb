require 'lvm/wrapper'

module LVM
  module Wrapper
    module PVCreate

      # Create a LVM Physical Volume out of a device
      # if fdisk does not find a partition on the disk and
      # if pvscan does not find an existing physical volume label
      def pvcreate(device)

        if checkDeviceOnPartition(device)
          if checkDeviceOnPV(device)
            External.cmd(@server, "#{@command} pvcreate #{device}")
          end
        end

      end

      # Check with pvscan if there is a lvm label on the device
      def checkDeviceOnPV(device)
        External.cmd(@server, "#{@command} pvscan #{device}").include? "No matching physical volumes found"
      end
      module_function :checkDeviceOnPV

      # Check with fdsik if there is a partition on the device
      def checkDeviceOnPartition(device)
        External.cmd(@server, "/usr/bin/sudo /sbin/fdisk -l #{device}").include? "Disk #{device} doesn't contain a valid partition table"
      end
      module_function :checkDeviceOnPartition

    end # module PVCREATE
  end # module Wrapper
end # module LVM
