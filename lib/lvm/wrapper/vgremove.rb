require 'lvm/wrapper'
require 'lvm/wrapper/pvs'

module LVM
  module Wrapper
    module VGRemove

      # Create a LVM Physical Volume out of a device
      # if fdisk does not find a partition on the disk and
      # if pvscan does not find an existing physical volume label
      def vg_remove(vgname)
        External.cmd(@server, "#{@command} vgremove #{vgname}")
      end


    end # module VGRemove 
  end # module Wrapper
end # module LVM
