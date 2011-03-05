require 'lvm/wrapper'
require 'lvm/wrapper/pvs'

module LVM
  module Wrapper
    module PVRemove

      # Remove a LVM PhyscialVolume Label from a disk
      # if physical volume does not belong to a volume group
      def pv_remove(physical_volume)
        External.cmd(@server, "#{@command} pvremove #{physical_volume.name}") if physical_volume.vg_uuid.nil?
      end

    end # module PVRemove
  end # module Wrapper
end # module LVM
