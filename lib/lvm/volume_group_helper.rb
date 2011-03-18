module LVM
  module VolumeGroupHelper

    def volume_group_check_space_in_kb(volume_group, size_in_kb)
      true if volume_group.free_in_bytes > size_in_kb && volume_group.max_lv >= volume_group.logical_volume_count
    end

    def volume_group_check_space_in_extents(volume_group, extents)
      true if volume_group.free_count > extents && volume_group.max_lv >= volume_group.logical_volume_count
    end

  end
end
