require 'lvm/volumes'
require 'lvm/wrapper/fdisk'


module LVM
  class Disks
    include Enumerable

    include Volumes
    include Wrapper

    def initialize(options)
      @disk    = FDISK.new(options)
    end

    # Gather all information about physical volumes.
    #
    # See VolumeGroups.each for a better representation of LVM data.
    def each
      disk    = @disk.list

      return disk.each { |p| yield p }
    end
  end

end