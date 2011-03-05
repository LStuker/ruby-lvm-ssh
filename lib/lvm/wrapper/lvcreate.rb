require 'lvm/wrapper'
require 'lvm/wrapper/lvs'

module LVM
  module Wrapper
    module LVCreate

      # Create a LVM Logical Volume.
      # Set the size with extents.
      # See vor lvcreate command http://linux.die.net/man/8/lvcreate
      # -l eq. --extents
      # -n eq. --name
      def lv_create_extents(logical_volume_name, volume_group, extents)
          External.cmd(@server, "#{@command} lvcreate -l #{extents} -n #{logical_volume_name} #{volume_group}") if volume_group_prerequisite_extents
      end

      # Create a LVM Logical Volume.
      # Set the size in kilobytes.
      # See vor lvcreate command http://linux.die.net/man/8/lvcreate
      # -l eq. --extents
      # -n eq. --name
      def lv_create_size_in_kb(logical_volume_name, volume_group, size_in_kb)
          External.cmd(@server, "#{@command} lvcreate -l #{size_in_kb} -n #{logical_volume_name} #{volume_group}") if volume_group_prerequisite
      end

      # Create a LVM Logical Volume mirrored with regions size of 8 MB.
      # Set the size with extents.
      # See vor lvcreate command http://linux.die.net/man/8/lvcreate
      # -l eq. --extents
      # -n eq. --name
      # -m1 eq. --mirrors
      # -R eq. --regionsize
      def lv_create_mirrored_extents(logical_volume_name, volume_group, extents)
          External.cmd(@server, "#{@command} lvcreate -m1 -R 8 -s #{extents} -n #{logical_volume_name} #{volume_group}") if volume_group_prerequisite_extents
      end

      # Create a LVM Logical Volume mirrored with regions size of 8 MB.
      # Set the size in kilobytes.
      # See vor lvcreate command http://linux.die.net/man/8/lvcreate
      # -l eq. --extents
      # -n eq. --name
      # -m1 eq. --mirrors
      # -R eq. --regionsize
      def lv_create_mirrored_size_in_kb(logical_volume_name, volume_group, size_in_kb)
          External.cmd(@server, "#{@command} lvcreate -m1 -R 8 -l #{size_in_kb} -n #{logical_volume_name} #{volume_group}") if volume_group_prerequisite
      end

      def volume_group_prerequisite(volume_group, size_in_kb)
        if volume_group.free_in_bytes > size_in_kb && volume_group.max_lv >= volume_group.logical_volume_count
      end

      def volume_group_prerequisite_extents(volume_group, extents)
        if volume_group.free_count > extents && volume_group.max_lv >= volume_group.logical_volume_count
      end

    end # module LVCreate
  end # module Wrapper
end # module LVM
