require 'lvm/wrapper'
require 'lvm/wrapper/pvs'

module LVM
  module Wrapper
    module PVCreate

      # Create a LVM Physical Volume out of a device
      # if fdisk does not find a partition on the disk and
      # if pvscan does not find an existing physical volume label
      def vg_create(vgname, devices)

        if partition_check_device(devices)
          if pv_check_device(devices)
            External.cmd(@server, "#{@command} vgcreate -s 32M #{vgname} #{devices}")
          end
        end

      end

      def vg_create_cluster(vgname, devices)

        if partition_check_device(devices)
          if pv_check_device(devices)
            External.cmd(@server, "#{@command} vgcreate -s 32M -c #{vgname} #{devices}")
          end
        end

      end


    end # module PVCREATE
  end # module Wrapper
end # module LVM
