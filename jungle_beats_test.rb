require 'minitest'                 # => true
require 'minitest/autorun'         # => true
require 'minitest/pride'           # => true
require_relative './jungle_beats'  # => true

class JungleBeatsTest < Minitest::Test

  def test_starts_with_no_head
    jb = JungleBeat.new         # => #<JungleBeat:0x007fa2e290d850 @head=nil>

    assert_equal nil, jb.head  # => true
  end

  def test_if_given_one_string_creates_head_with_only_link
    jb = JungleBeat.new("deep")                             # => #<JungleBeat:0x007fa2e2904638 @head=#<Node:0x007fa2e29045c0 @data=nil, @link=#<Node:0x007fa2e2904598 @data="deep", @link=nil>>>

    assert_equal "deep", jb.head.link.data  # => true
    assert_equal nil, jb.head.data          # => true
  end

  def test_if_given_multiple_string_creates_head_and_nodes
    jb = JungleBeat.new("deep boop derp burp")              # => #<JungleBeat:0x007fa2e290e6d8 @head=#<Node:0x007fa2e290e5e8 @data=nil, @link=#<Node:0x007fa2e290e5c0 @data="deep", @link=#<Node:0x007fa2e290e598 @data="boop", @link=#<Node:0x007fa2e290e570 @data="derp", @link=#<Node:0x007fa2e290e548 @data="burp", @link=nil>>>>>>

    assert_equal nil, jb.head.data                         # => true
    assert_equal "deep", jb.head.link.data                 # => true
    assert_equal "boop", jb.head.link.link.data            # => true
    assert_equal "derp", jb.head.link.link.link.data       # => true
    assert_equal "burp", jb.head.link.link.link.link.data  # => true
  end

  def test_can_find_head_with_one_string
    jb = JungleBeat.new("deep")           # => #<JungleBeat:0x007fa2e290c310 @head=#<Node:0x007fa2e290c298 @data=nil, @link=#<Node:0x007fa2e290c270 @data="deep", @link=nil>>>

    jb.find_head  # => #<Node:0x007fa2e290c298 @data=nil, @link=#<Node:0x007fa2e290c270 @data="deep", @link=nil>>

    assert_equal nil, jb.head.data  # => true
    refute nil, jb.head.link        # => false
  end

  def test_can_find_head_with_multiple_string
    jb = JungleBeat.new("deep boop")           # => #<JungleBeat:0x007fa2e290cce8 @head=#<Node:0x007fa2e290cc48 @data=nil, @link=#<Node:0x007fa2e290cc20 @data="deep", @link=#<Node:0x007fa2e290cbf8 @data="boop", @link=nil>>>>

    jb.find_head  # => #<Node:0x007fa2e290cc48 @data=nil, @link=#<Node:0x007fa2e290cc20 @data="deep", @link=#<Node:0x007fa2e290cbf8 @data="boop", @link=nil>>>

    assert_equal nil, jb.head.data  # => true
    refute nil, jb.head.link        # => false
  end

  def test_can_find_tail_with_one_string
    jb = JungleBeat.new("deep")

    assert_equal nil, jb.find_tail.link
  end

  def test_can_find_tail_with_one_string
    jb = JungleBeat.new("deep burp")      # => #<JungleBeat:0x007fa2e290d3c8 @head=#<Node:0x007fa2e290d328 @data=nil, @link=#<Node:0x007fa2e290d300 @data="deep", @link=#<Node:0x007fa2e290d2d8 @data="burp", @link=nil>>>>

    assert_equal nil, jb.find_tail.link  # => true
  end

  def test_can_append_single_beat_to_empty_beat
    jb = JungleBeat.new                          # => #<JungleBeat:0x007fa2e290fab0 @head=nil>
    jb.append("deep")                            # => #<Node:0x007fa2e290f920 @data="deep", @link=nil>

    assert_equal "deep", jb.head.link.data  # => true
    assert_equal nil, jb.head.link.link     # => true
  end

  def test_can_append_single_beat_to_existing_beat
    jb = JungleBeat.new("deep")                     # => #<JungleBeat:0x007fa2e2802668 @head=#<Node:0x007fa2e2802028 @data=nil, @link=#<Node:0x007fa2e2802000 @data="deep", @link=nil>>>
    jb.append("burp")                               # => ["burp"]

    assert_equal "deep", jb.head.link.data       # => true
    refute nil, jb.head.link.link                # => false
    assert_equal "burp", jb.head.link.link.data  # => true
    assert_equal nil, jb.head.link.link.link     # => true
  end

  def test_can_append_multiple_beats_to_existing_beat
    jb = JungleBeat.new("deep")                        # => #<JungleBeat:0x007fa2e290f2e0 @head=#<Node:0x007fa2e290f268 @data=nil, @link=#<Node:0x007fa2e290f240 @data="deep", @link=nil>>>
    jb.append("burp boop")                             # => ["burp", "boop"]

    assert_equal "burp", jb.head.link.link.data       # => true
    refute nil, jb.head.link.link.link                # => false
    assert_equal "boop", jb.head.link.link.link.data  # => true
    assert_equal nil, jb.head.link.link.link.link     # => true
  end
end

# >> Run options: --seed 17083
# >>
# >> # Running:
# >>
# >> .........
# >>
# >> Finished in 0.001312s, 6859.4372 runs/s, 17529.6728 assertions/s.
# >>
# >> 9 runs, 23 assertions, 0 failures, 0 errors, 0 skips
