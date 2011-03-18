require 'lvm/wrapper'
require 'lvm/disk'


module LVM
  module Wrapper
    class FDISK

      attr_reader :attributes
      attr_reader :command
      attr_reader :server

      def initialize(options)
        @server  = options[:server]
        @command = options[:command]
      end

      def list
        output = get_disk_from_dmesg()
        data   = parse(output)

        if block_given?
          return data.each { |obj| yield obj }
        else
          return data
        end
      end

     # private

      def get_disk_from_dmesg
        External.cmd(@server, "dmesg | grep \"SCSI device\" | uniq")
      end

      # Parses the output of self.command
      def parse(output)
        volumes = []

        output.split("\n").each do |line|

          args   = parse_attributes(line)


          # finally build our object
          volume = Disk.new(args)


          if block_given?
            yield volume
          else
            volumes << volume
          end
        end

        return volumes
      end


      def parse_attributes(line)
        attributes               = {}

        attributes[:name]        = parse_diskname(line)
        attributes[:sectors]     = parse_sectors(line)
        attributes[:sectorsunit] = parse_sectoreunit(line)
        attributes[:size]        = size(attributes[:sectors], attributes[:sectorsunit])
        attributes[:partition]   = partition_check_device(attributes[:name])
        attributes[:pv_label]    = pvlabel_check_device(attributes[:name])

        return attributes
      end


      def parse_sectoreunit(line)
        line.split(" ")[4].split("-byte")[0].to_i
      end

      def parse_sectors(line)
        line.split(" ")[3].to_i
      end

      def parse_diskname(line)
        "/dev/" + line.split(" ")[2].split(":")[0]
      end

      def size(sectors, sectorsunit)
        sectors * sectorsunit
      end

      # Check with fdsik if there is a partition on the device
      def partition_check_device(devicename)
        if External.cmd(@server, "/usr/bin/sudo /sbin/fdisk -l #{devicename}").include? "Disk #{devicename} doesn't contain a valid partition table"
          false
        else
          true
        end
      end

      # Check with pvck if there is a pv label on the device
      def pvlabel_check_device(devicename)
        External.cmd(@server, "#{@command} pvck #{devicename}").include? "Found label on #{devicename}"
      end


    end # class Fdisk
  end # module Wrapper
end # module LVM
