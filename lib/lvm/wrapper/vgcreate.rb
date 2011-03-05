require File.expand_path(File.dirname(__FILE__) + '/physical_volume_used.rb')
require 'lvm/wrapper'
require 'lvm/wrapper/vgs'

module LVM
  module Wrapper
    module VGCreate
    include PhysicalVolumeUsed


      # Create a Volume Group with Extents Size of 32 MB.
      # if physical volumes are note used.
      # See vor vgcreate command http://linux.die.net/man/8/vgcreate
      # -c eq. --clustered
      # -s eq. --physicalextentsize
      def vg_create(volume_group_name, physical_volumes)
        External.cmd(@server, "#{@command} vgcreate -s 32M #{volume_group_name} #{physical_volumes.to_s}") if physical_volumes_unused(physical_volumes)
      end

      # Create a Clustered Volume Group with Extents Size of 32 MB.
      # if physical volumes are note used.
      # See vor vgcreate command http://linux.die.net/man/8/vgcreate
      # -c eq. --clustered
      # -s eq. --physicalextentsize
      def vg_create_cluster(volume_group_name, physical_volumes)
        External.cmd(@server, "#{@command} vgcreate -s 32M -s #{volume_group_name} #{physical_volumes.to_s}") if physical_volumes_unused(physical_volumes)
      end


      

#      # Give a physicalvolumes_list back from an array with physicalvolumes
#      # e.g. "/dev/sda /dev/sdb /dev/sdc"
#      def physicalvolumes_list(physicalvolumes)
#        physicalvolumes_list= physicalvolumes.join(" ")
#      end

    end # module VGCreate
  end # module Wrapper
end # module LVM
