require 'lvm/wrapper'
require 'lvm/wrapper/lvs'
require 'lvm/volume_group_helper'

module LVM
  module Wrapper
    module LVExtend

      include VolumeGroupHelper

      # Create a LVM Logical Volume.
      # Set the size with extents.
      # See vor lvcreate command http://linux.die.net/man/8/lvcreate
      # -l eq. --extents
      # -n eq. --name
      def lv_extend_extents(logical_volume_name, volume_group, extents)
          External.cmd(@server, "#{@command} lvextend -l +#{extents} -n #{logical_volume_name}")if volume_group_check_space_in_extents(volume_group,extents)
      end

      # Create a LVM Logical Volume.
      # Set the size in kilobytes.
      # See vor lvcreate command http://linux.die.net/man/8/lvcreate
      # -l eq. --extents
      # -n eq. --name
      def lv_extend_size_in_kb(logical_volume_name, volume_group, size_in_kb)
          External.cmd(@server, "#{@command} lvextent -L #{size_in_kb} -n #{logical_volume_name}") if volume_group_check_space_in_kb(volume_group,size_in_kb)
      end


    end # module LVExtend
  end # module Wrapper
end # module LVM
