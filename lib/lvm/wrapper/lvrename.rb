require 'lvm/wrapper'
require 'lvm/wrapper/pvs'

module LVM
  module Wrapper
    module LVRename

      # Rename a LVM Logical Volume.
      # See vor lvrename command http://linux.die.net/man/8/lvrename
      def lv_rename(logical_volume, new_logical_volume_name)
        External.cmd(@server, "#{@command} lvrename #{logical_volume.name} #{new_logical_volume_name}")
      end


    end # module LVRename
  end # module Wrapper
end # module LVM
