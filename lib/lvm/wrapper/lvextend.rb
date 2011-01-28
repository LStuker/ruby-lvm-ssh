require 'lvm/wrapper'
require 'lvm/wrapper/pvs'

module LVM
  module Wrapper
    module PVRename

      # Create a LVM Physical Volume out of a device
      # if fdisk does not find a partition on the disk and
      # if pvscan does not find an existing physical volume label
      def vg_rename(uuid, vgname)
        External.cmd(@server, "#{@command} vgrename #{uuid} #{vgname}")
      end


    end # module PVCREATE
  end # module Wrapper
end # module LVM
