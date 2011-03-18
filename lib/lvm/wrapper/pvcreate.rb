require 'lvm/wrapper'
require 'lvm/wrapper/pvs'

module LVM
  module Wrapper
    module PVCreate

      # Create a LVM Physical Volume out of a device
      # if disk has now partition and now physical volume label
      def pv_create(device)
        External.cmd(@server, "#{@command} pvcreate #{device.name}") if not device.partition || device.pv_label
      end

#
#      # Check with pvscan if there is a lvm label on the device
#      def pv_check_device(devicename)
#        External.cmd(@server, "#{@command} pvscan #{devicename}").include? "No matching physical volumes found"
#      end
#
#      module_function :pv_check_device
#
#      # Check with fdsik if there is a partition on the device
#      def partition_check_device(devicename)
#        External.cmd(@server, "/usr/bin/sudo /sbin/fdisk -l #{devicename}").include? "Disk #{devicename} doesn't contain a valid partition table"
#      end
#
#      module_function :partition_check_device

    end # module PVCreate
  end # module Wrapper
end # module LVM
