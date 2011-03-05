require 'lvm/wrapper'
require 'lvm/wrapper/pvs'

module LVM
  module Wrapper
    module LVRemove

      # Remove a LVM Logical Volume.
      # See vor lvremove command http://linux.die.net/man/8/lvremove
      # -f eq. --force
      def lv_remove(logical_volume)
        External.cmd(@server, "#{@command} lvremove -f #{logical_volume.name}")
      end


    end # module LVRemove
  end # module Wrapper
end # module LVM
