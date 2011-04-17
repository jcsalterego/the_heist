$LOAD_PATH.unshift File.expand_path(File.dirname(__FILE__) + '/../lib')
require 'test/unit'
require 'heist' 

class TestHeist < Test::Unit::TestCase
  
  def setup
    # load in the gemlist.txt fixture
    @gem_list = File.open('tests/gemlist.txt').read.split("\n")
    @gem_versions_count = @gem_list.to_s.count(",") + @gem_list.size
  end

  def test_heist_no_argv
    install_commands = %x[cat tests/gemlist.txt | bin/heist].split("\n")
    assert_equal(@gem_versions_count, install_commands.size)
    # this test assumes that we have a "rc" versioned gem
    assert_match(/rc/, install_commands.join(" "))
  end

  def test_heist_recent_argv
    install_commands = %x[cat tests/gemlist.txt | bin/heist --recent].split("\n")
    assert_equal(@gem_list.size, install_commands.size)    
    # this test assumes that we have a "rc" versioned gem which isn't the most recent
    assert_no_match(/rc/, install_commands.join(" "))
  end

  def test_heist_recent_argv_correct_version
    # with each gem install command, make sure it's the newest version
    install_commands = %x[cat tests/gemlist.txt | bin/heist --recent].split("\n")
    @gem_list.each do |gemline|
      recent_version = gemline.match(/\((.*?)[,\)]/)[1]
      assert(install_commands.join("").match(recent_version))
    end
  end

end