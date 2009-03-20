# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{ruby-lvm}
  s.version = "0.1.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Matthew Kent"]
  s.date = %q{2009-03-19}
  s.description = %q{This is a wrapper for the LVM2 administration utility, lvm. Its primary function it to convert physical volumes, logical volumes and volume groups into easy to use ruby objects. It also provides a simple wrapper for typical create/delete/etc operations.  Due to a lack of LVM2 api this is a best effort attempt at ruby integration but subject to complete replacement in the future.}
  s.email = ["mkent@magoazul.com"]
  s.extra_rdoc_files = ["History.txt", "Manifest.txt", "README.txt", "Todo.txt"]
  s.files = ["History.txt", "Manifest.txt", "README.txt", "Rakefile", "Todo.txt", "examples/create_snapshot.rb", "examples/error_handling.rb", "examples/show_lvm_config.rb", "lib/lvm.rb", "lib/lvm/external.rb", "lib/lvm/logical_volume.rb", "lib/lvm/logical_volume_segment.rb", "lib/lvm/logical_volumes.rb", "lib/lvm/physical_volume.rb", "lib/lvm/physical_volume_segment.rb", "lib/lvm/physical_volumes.rb", "lib/lvm/userland.rb", "lib/lvm/volume_group.rb", "lib/lvm/volume_groups.rb", "lib/lvm/volumes.rb", "lib/lvm/wrapper.rb", "lib/lvm/wrapper/constants.rb", "lib/lvm/wrapper/lvs.rb", "lib/lvm/wrapper/lvsseg.rb", "lib/lvm/wrapper/pvs.rb", "lib/lvm/wrapper/pvsseg.rb", "lib/lvm/wrapper/vgs.rb", "test/test_lvm.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://ruby-lvm.rubyforge.org}
  s.rdoc_options = ["--main", "README.txt"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{ruby-lvm}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{This is a wrapper for the LVM2 administration utility, lvm}
  s.test_files = ["test/test_lvm.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<open4>, [">= 0.9.6"])
      s.add_runtime_dependency(%q<ruby-lvm-attrib>, [">= 0.0.1"])
      s.add_development_dependency(%q<hoe>, [">= 1.11.0"])
    else
      s.add_dependency(%q<open4>, [">= 0.9.6"])
      s.add_dependency(%q<ruby-lvm-attrib>, [">= 0.0.1"])
      s.add_dependency(%q<hoe>, [">= 1.11.0"])
    end
  else
    s.add_dependency(%q<open4>, [">= 0.9.6"])
    s.add_dependency(%q<ruby-lvm-attrib>, [">= 0.0.1"])
    s.add_dependency(%q<hoe>, [">= 1.11.0"])
  end
end
