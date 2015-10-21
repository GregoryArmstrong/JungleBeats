require 'minitest'          # => true
require 'minitest/autorun'  # => true
require 'minitest/pride'    # => true
require './jungle_beats'    # ~> LoadError: cannot load such file -- ./jungle_beats

class JungleBeatsTest < Minitest::Test

  def test_starts_with_no_head
    jb = JungleBeat.new

    assert_equal nil, jb.head
  end

  def test_if_given_one_string_creates_head_with_only_link
    jb = JungleBeat.new("deep")

    assert_equal "deep", jb.head.link.data
    assert_equal nil, jb.head.data
  end

  def test_if_given_multiple_string_creates_head_and_nodes
    jb = JungleBeat.new("deep boop derp burp")

    assert_equal nil, jb.head.data
    assert_equal "deep", jb.head.link.data
    assert_equal "boop", jb.head.link.link.data
    assert_equal "derp", jb.head.link.link.link.data
    assert_equal "burp", jb.head.link.link.link.link.data
  end

  def test_can_find_head_with_one_string
    jb = JungleBeat.new("deep")

    jb.find_head

    assert_equal nil, jb.head.data
    refute nil, jb.head.link
  end

  def test_can_find_head_with_multiple_string
    jb = JungleBeat.new("deep boop")

    jb.find_head

    assert_equal nil, jb.head.data
    refute nil, jb.head.link
  end

  def test_can_find_tail_with_one_string
    jb = JungleBeat.new("deep")

    assert_equal nil, jb.find_tail.link
  end

  def test_can_find_tail_with_one_string
    jb = JungleBeat.new("deep burp")

    assert_equal nil, jb.find_tail.link
  end




















end

# >> Run options: --seed 16597
# >>
# >> # Running:
# >>
# >>
# >>
# >> Finished in 0.001035s, 0.0000 runs/s, 0.0000 assertions/s.
# >>
# >> 0 runs, 0 assertions, 0 failures, 0 errors, 0 skips

# ~> LoadError
# ~> cannot load such file -- ./jungle_beats
# ~>
# ~> /Users/gregoryarmstrong/.rvm/rubies/ruby-2.2.3/lib/ruby/2.2.0/rubygems/core_ext/kernel_require.rb:54:in `require'
# ~> /Users/gregoryarmstrong/.rvm/rubies/ruby-2.2.3/lib/ruby/2.2.0/rubygems/core_ext/kernel_require.rb:54:in `require'
# ~> /Users/gregoryarmstrong/turing/1module/JungleBeats/jungle_beats_test.rb:4:in `<main>'
