module LVM
  module PhysicalVolumeHelper
    
    #Check if physical_volumes are note used
    def physical_volumes_unused(physical_volumes_array)
      is_unused = true
      for physical_volume in physical_volumes_array
        is_unused = false if not physical_volume.vg_uuid.nil?
      end
      return is_unused
    end

    def physical_volumes_to_s(physical_volumes_array)
      x = []
      physical_volumes_array.each { |o| x << o.name }
      return x.join(" ")
    end


  end
end

  
