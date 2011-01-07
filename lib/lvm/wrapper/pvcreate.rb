require 'lvm/wrapper'

module LVM
  module Wrapper
    module PVCreate

      # Create a LVM Physical Volume out of a device
      # if fdisk does not find a partition on the disk and
      # if pvscan does not find an existing physical volume label
      def pvcreate(devicename)

        if checkDeviceOnPartition(devicename)
          if checkDeviceOnPV(devicename)
            External.cmd(@server, "#{@command} pvcreate #{devicename}")
          end
        end

      end

      # Check with pvscan if there is a lvm label on the device
      def checkDeviceOnPV(devicename)
        External.cmd(@server, "#{@command} pvscan #{devicename}").include? "No matching physical volumes found"
      end
      module_function :checkDeviceOnPV

      # Check with fdsik if there is a partition on the device
      def checkDeviceOnPartition(devicename)
        External.cmd(@server, "/usr/bin/sudo /sbin/fdisk -l #{devicename}").include? "Disk #{devicename} doesn't contain a valid partition table"
      end
      module_function :checkDeviceOnPartition

    end # module PVCREATE
  end # module Wrapper
end # module LVM
