require 'lvm/external'
require 'lvm/userland'
require 'lvm/disks'
require 'lvm/physical_volumes'
require 'lvm/volume_groups'
require 'lvm/logical_volumes'
require 'lvm/wrapper/pvcreate'
require 'lvm/wrapper/pvremove'
require 'lvm/wrapper/vgcreate'
require 'lvm/wrapper/vgrename'
require 'lvm/wrapper/vgremove'
require 'lvm/wrapper/vgextend'
require 'lvm/wrapper/lvcreate'
require 'lvm/wrapper/lvrename'
require 'lvm/wrapper/lvremove'
require 'lvm/wrapper/lvextend'



module LVM
  VERSION = 'default'

  class LVM

    include Wrapper::PVCreate
    include Wrapper::PVRemove
    include Wrapper::VGCreate
    include Wrapper::VGRename
    include Wrapper::VGRemove
    include Wrapper::VGExtend
    include Wrapper::LVCreate
    include Wrapper::LVRename
    include Wrapper::LVRemove
    include Wrapper::LVExtend


    attr_reader :command
    attr_reader :server
    attr_reader :logical_volumes
    attr_reader :volume_groups
    attr_reader :physical_volumes
    attr_reader :disks

    VALID_OPTIONS   = [
        :command,
        :server,
        :version,
        :debug
    ]

    DEFAULT_COMMAND = '/usr/bin/sudo /sbin/lvm'
    DEFAULT_SERVER  = 'localhost'

    def initialize(options={})
      # handy, thanks net-ssh!
      invalid_options = options.keys - VALID_OPTIONS
      if invalid_options.any?
        raise ArgumentError, "invalid option(s): #{invalid_options.join(', ')}"
      end
      @server  = options[:server] || DEFAULT_SERVER
      @command = options[:command] || DEFAULT_COMMAND

      if @server == DEFAULT_SERVER
        options[:server] = DEFAULT_SERVER
      end
      if @command == DEFAULT_COMMAND
        options[:command] = DEFAULT_COMMAND
      end
      @options = options


      # default to loading attributes for the current version
      options[:version] ||= VERSION
      options[:debug]   ||= false

      @disks = Disks.new(@options)
      @physical_volumes = PhysicalVolumes.new(@options)
      @volume_groups = VolumeGroups.new(@options)
      @logical_volumes = LogicalVolumes.new(@options)


      if block_given?
        yield self
      else
        return self
      end
    end # end initialize


    def raw(args)
      output = []
      External.cmd(@server, "#{@command} #{args}") do |line|
        output << line
      end
      if block_given?
        return output.each { |l| yield l }
      else
        return output.join
      end
    end

    def version
      %r{^(.*?)(-| )}.match(userland.lvm_version)[1]
    end

    # helper methods
    def userland
      userland = UserLand.new
      raw('version') do |line|
        case line
          when %r{^\s+LVM version:\s+([0-9].*)$}
            userland.lvm_version = $1
          when %r{^\s+Library version:\s+([0-9].*)$}
            userland.library_version = $1
          when %r{^\s+Driver version:\s+([0-9].*)$}
            userland.driver_version = $1
        end
      end

      return userland
    end

  end
end