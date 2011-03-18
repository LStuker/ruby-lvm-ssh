require "test/unit"
require 'flexmock/test_unit'
require 'lib/lvm/wrapper/fdisk'


class TestFdisk < Test::Unit::TestCase

  include FlexMock::TestCase
  

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup

   # @disk    = FDISK.new(options)
    #ßflexmock(get_disk_from_dmesg).new_instances.should_receive(:cmd => "SCSI device sda: 16777216 512-byte hdwr sectors (8590 MB)")
  end

  # Called after every test method runs. Can be used to tear
  # down fixture information.

  def teardown
    # Do nothing
  end

  def test_simple
    options={}
    options[:server] = 'localhost'
    assert_equal("512","512" )
  end

end