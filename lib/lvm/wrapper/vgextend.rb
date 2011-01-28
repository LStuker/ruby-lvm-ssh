require 'lvm/wrapper'
require 'lvm/wrapper/pvs'

module LVM
  module Wrapper
    module VGextend

      # Create a LVM Physical Volume out of a device
      # if fdisk does not find a partition on the disk and
      # if pvscan does not find an existing physical volume label
      def vg_extend(vgname, pvpath)
        External.cmd(@server, "#{@command} vgextend #{vgname} #{pvpath}")
      end


    end # module VGextend
  end # module Wrapper
end # module LVM
