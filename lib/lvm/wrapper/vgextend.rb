require 'lvm/wrapper'
require 'lvm/wrapper/pvs'

module LVM
  module Wrapper
    module VGExtend

      # Extend a LVM Volume Group.
      # See vor vgextend command http://linux.die.net/man/8/vgextend
      def vg_extend(volume_group, physical_volumes)
        External.cmd(@server, "#{@command} vgextend #{volume_group.name} #{physical_volumes.to_s}") if physical_volumes_unused(physical_volumes)
      end

    end # module VGExtend
  end # module Wrapper
end # module LVM
