require 'lvm/wrapper'
require 'lvm/wrapper/pvs'

module LVM
  module Wrapper
    module PVCreate

      # Create a LVM Physical Volume out of a device
      # if fdisk does not find a partition on the disk and
      # if pvscan does not find an existing physical volume label
      def pv_create(devicename)

        if partition_check_device(devicename)
          if pv_check_device(devicename)
            External.cmd(@server, "#{@command} pvcreate #{devicename}")
          end
        end

      end

      # Check with pvscan if there is a lvm label on the device
      def pv_check_device(devicename)
        External.cmd(@server, "#{@command} pvscan #{devicename}").include? "No matching physical volumes found"
      end
      module_function :checkDeviceOnPV

      # Check with fdsik if there is a partition on the device
      def partition_check_device(devicename)
        External.cmd(@server, "/usr/bin/sudo /sbin/fdisk -l #{devicename}").include? "Disk #{devicename} doesn't contain a valid partition table"
      end
      module_function :checkDeviceOnPartition

    end # module PVCREATE
  end # module Wrapper
end # module LVM
