require 'lvm/wrapper'
require 'lvm/wrapper/pvs'

module LVM
  module Wrapper
    module VGmerge

      # Create a LVM Physical Volume out of a device
      # if fdisk does not find a partition on the disk and
      # if pvscan does not find an existing physical volume label
      def vg_merge(vgname1, vgname2)
        External.cmd(@server, "#{@command} vgmerge #{vgname1} #{vgname2}")
      end


    end # module VGmerge
  end # module Wrapper
end # module LVM
