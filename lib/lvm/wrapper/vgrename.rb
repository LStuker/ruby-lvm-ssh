require 'lvm/wrapper'
require 'lvm/wrapper/pvs'

module LVM
  module Wrapper
    module VGRename

      # Rename a LVM Volume Group.
      # See vor vgrename command http://linux.die.net/man/8/vgrename
      def vg_rename(volume_group, volume_group_name)
        External.cmd(@server, "#{@command} vgrename #{volume_group.uuid} #{volume_group_name}")
      end


    end # module VGRename
  end # module Wrapper
end # module LVM
