require 'ostruct'

module LVM
  class VolumeGroup < OpenStruct;

    def logical_volume_count
      self.logical_volumes.count
    end

  end
end
