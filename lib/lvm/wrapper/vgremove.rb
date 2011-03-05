require 'lvm/wrapper'
require 'lvm/wrapper/pvs'

module LVM
  module Wrapper
    module VGRemove

      # Remove a empty LVM Volume Group.
      # See vor vgremove command http://linux.die.net/man/8/vgremove
      def vg_remove(volume_group)
        #If there is no logical volume than the volumegroup can be removed
        External.cmd(@server, "#{@command} vgremove #{volume_group.name}") if volume_group.logical_volumes.empty?
      end

    end # module VGRemove 
  end # module Wrapper
end # module LVM
