require 'minitest'                 # => true
require 'minitest/autorun'         # => true
require 'minitest/pride'           # => true
require_relative './jungle_beats'  # => true

class JungleBeatsTest < Minitest::Test

  def test_starts_with_no_head
    jb = JungleBeat.new         # => #<JungleBeat:0x007fa7fa2a81c8 @head=nil>

    assert_equal nil, jb.head  # => true
  end

  def test_if_given_one_string_creates_head_with_only_link
    jb = JungleBeat.new("deep")                             # => #<JungleBeat:0x007fa7fa2a2ef8 @head=#<Node:0x007fa7fa2a2e80 @data=nil, @link=#<Node:0x007fa7fa2a2e58 @data="deep", @link=nil>>>

    assert_equal "deep", jb.head.link.data  # => true
    assert_equal nil, jb.head.data          # => true
  end

  def test_if_given_multiple_string_creates_head_and_nodes
    jb = JungleBeat.new("deep boop derp burp")              # => #<JungleBeat:0x007fa7fa2ab508 @head=#<Node:0x007fa7fa2ab418 @data=nil, @link=#<Node:0x007fa7fa2ab3f0 @data="deep", @link=#<Node:0x007fa7fa2ab3c8 @data="boop", @link=#<Node:0x007fa7fa2ab3a0 @data="derp", @link=#<Node:0x007fa7fa2ab378 @data="burp", @link=nil>>>>>>

    assert_equal nil, jb.head.data                         # => true
    assert_equal "deep", jb.head.link.data                 # => true
    assert_equal "boop", jb.head.link.link.data            # => true
    assert_equal "derp", jb.head.link.link.link.data       # => true
    assert_equal "burp", jb.head.link.link.link.link.data  # => true
  end

  def test_can_find_head_with_one_string
    jb = JungleBeat.new("deep")           # => #<JungleBeat:0x007fa7fa2a2070 @head=#<Node:0x007fa7fa2a1ff8 @data=nil, @link=#<Node:0x007fa7fa2a1fd0 @data="deep", @link=nil>>>

    jb.find_head  # => #<Node:0x007fa7fa2a1ff8 @data=nil, @link=#<Node:0x007fa7fa2a1fd0 @data="deep", @link=nil>>

    assert_equal nil, jb.head.data  # => true
    refute nil, jb.head.link        # => false
  end

  def test_can_find_head_with_multiple_string
    jb = JungleBeat.new("deep boop")           # => #<JungleBeat:0x007fa7fa2985c0 @head=#<Node:0x007fa7fa298520 @data=nil, @link=#<Node:0x007fa7fa2984f8 @data="deep", @link=#<Node:0x007fa7fa2984d0 @data="boop", @link=nil>>>>

    jb.find_head  # => #<Node:0x007fa7fa298520 @data=nil, @link=#<Node:0x007fa7fa2984f8 @data="deep", @link=#<Node:0x007fa7fa2984d0 @data="boop", @link=nil>>>

    assert_equal nil, jb.head.data  # => true
    refute nil, jb.head.link        # => false
  end

  def test_can_find_tail_with_one_string
    jb = JungleBeat.new("deep")

    assert_equal nil, jb.find_tail.link
  end

  def test_can_find_tail_with_one_string
    jb = JungleBeat.new("deep burp")      # => #<JungleBeat:0x007fa7fa2a2750 @head=#<Node:0x007fa7fa2a26b0 @data=nil, @link=#<Node:0x007fa7fa2a2688 @data="deep", @link=#<Node:0x007fa7fa2a2660 @data="burp", @link=nil>>>>

    assert_equal nil, jb.find_tail.link  # => true
  end

  def test_can_append_single_beat_to_empty_beat
    jb = JungleBeat.new                          # => #<JungleBeat:0x007fa7fa2923a0 @head=nil>
    jb.append("deep")                            # => ["deep"]

    assert_equal "deep", jb.head.link.data  # => true
    assert_equal nil, jb.head.link.link     # => true
  end

  def test_can_append_single_beat_to_existing_beat
    jb = JungleBeat.new("deep")                     # => #<JungleBeat:0x007fa7fa29a7a8 @head=#<Node:0x007fa7fa29a730 @data=nil, @link=#<Node:0x007fa7fa29a708 @data="deep", @link=nil>>>
    jb.append("burp")                               # => ["burp"]

    assert_equal "deep", jb.head.link.data       # => true
    refute nil, jb.head.link.link                # => false
    assert_equal "burp", jb.head.link.link.data  # => true
    assert_equal nil, jb.head.link.link.link     # => true
  end

  def test_can_append_multiple_beats_to_empty_beat
    jb = JungleBeat.new                             # => #<JungleBeat:0x007fa7fa2b3a50 @head=nil>
    jb.append("deep boop")                          # => ["deep", "boop"]

    assert_equal "deep", jb.head.link.data       # => true
    refute nil, jb.head.link.link                # => false
    assert_equal "boop", jb.head.link.link.data  # => true
    assert_equal nil, jb.head.link.link.link     # => true
  end

  def test_can_append_multiple_beats_to_existing_beat
    jb = JungleBeat.new("deep")                        # => #<JungleBeat:0x007fa7fa299c18 @head=#<Node:0x007fa7fa299ba0 @data=nil, @link=#<Node:0x007fa7fa299b78 @data="deep", @link=nil>>>
    jb.append("burp boop")                             # => ["burp", "boop"]

    assert_equal "burp", jb.head.link.link.data       # => true
    refute nil, jb.head.link.link.link                # => false
    assert_equal "boop", jb.head.link.link.link.data  # => true
    assert_equal nil, jb.head.link.link.link.link     # => true
  end

  def test_can_prepend_to_no_beats
    jb = JungleBeat.new             # => #<JungleBeat:0x007fa7fa2a9cd0 @head=nil>
    jb.prepend("deep")              # => ["deep"]

    assert_equal "deep", jb.head.link.data  # => true
    assert_equal nil, jb.head.link.link     # => true
  end

  def test_can_prepend_to_one_beat
    jb = JungleBeat.new("deep")     # => #<JungleBeat:0x007fa7fa82de18 @head=#<Node:0x007fa7fa82dc60 @data=nil, @link=#<Node:0x007fa7fa82dc38 @data="deep", @link=nil>>>
    jb.prepend("boop")              # => #<Node:0x007fa7fa82dc38 @data="deep", @link=nil>
    jb.head.link                    # => #<Node:0x007fa7fa82c1f8 @data="boop", @link=#<Node:0x007fa7fa82dc38 @data="deep", @link=nil>>

    assert_equal "boop", jb.head.link.data       # => true
    refute nil, jb.head.link.link                # => false
    assert_equal "deep", jb.head.link.link.data  # => true
    assert_equal nil, jb.head.link.link.link     # => true
  end

  def test_can_prepend_to_multiple_beats
    jb = JungleBeat.new("deep boop")      # => #<JungleBeat:0x007fa7fa2a0478 @head=#<Node:0x007fa7fa2a03d8 @data=nil, @link=#<Node:0x007fa7fa2a03b0 @data="deep", @link=#<Node:0x007fa7fa2a0388 @data="boop", @link=nil>>>>
    jb.prepend("blap borp")               # => #<Node:0x007fa7fa2a03b0 @data="deep", @link=#<Node:0x007fa7fa2a0388 @data="boop", @link=nil>>
    jb.head.link                          # => #<Node:0x007fa7fa2a0018 @data="blap", @link=#<Node:0x007fa7fa827db0 @data="borp", @link=#<Node:0x007fa7fa2a03b0 @data="deep", @link=#<Node:0x007fa7fa2a0388 @data="boop", @link=nil>>>>

    assert_equal "blap", jb.head.link.data                 # => true
    refute nil, jb.head.link.link                          # => false
    assert_equal "borp", jb.head.link.link.data            # => true
    refute nil, jb.head.link.link.link                     # => false
    assert_equal "deep", jb.head.link.link.link.data       # => true
    refute nil, jb.head.link.link.link.link                # => false
    assert_equal "boop", jb.head.link.link.link.link.data  # => true
    assert_equal nil, jb.head.link.link.link.link.link     # => true
  end

  def test_can_insert_one_beat_into_empty_list
    skip
    jb = JungleBeat.new
    jb.insert(0, "tee")

    assert_equal "tee", jb.head.link.data
  end

  def test_can_insert_single_beat_into_list
    jb = JungleBeat.new("deep boop")         # => #<JungleBeat:0x007fa7fa2a90a0 @head=#<Node:0x007fa7fa2a9000 @data=nil, @link=#<Node:0x007fa7fa2a8fd8 @data="deep", @link=#<Node:0x007fa7fa2a8fb0 @data="boop", @link=nil>>>>
    jb.insert(1, "tee")                      # => #<Node:0x007fa7fa2a8fb0 @data="boop", @link=nil>

    assert_equal "deep", jb.head.link.data            # => true
    refute nil, jb.head.link.link                     # => false
    assert_equal "tee", jb.head.link.link.data        # => true
    refute nil, jb.head.link.link.link                # => false
    assert_equal "boop", jb.head.link.link.link.data  # => true
    assert_equal nil, jb.head.link.link.link.link     # => true
  end

  def test_can_insert_multiple_beats_into_list
    jb = JungleBeat.new("deep tee boop do")     # => #<JungleBeat:0x007fa7fa291bd0 @head=#<Node:0x007fa7fa291ae0 @data=nil, @link=#<Node:0x007fa7fa291ab8 @data="deep", @link=#<Node:0x007fa7fa291a90 @data="tee", @link=#<Node:0x007fa7fa291a68 @data="boop", @link=#<Node:0x007fa7fa291a40 @data="do", @link=nil>>>>>>
    jb.insert(2, "blap durp")                   # => #<Node:0x007fa7fa291a68 @data="boop", @link=#<Node:0x007fa7fa291a40 @data="do", @link=nil>>

    assert_equal "deep", jb.head.link.data                         # => true
    refute nil, jb.head.link.link                                  # => false
    assert_equal "tee", jb.head.link.link.data                     # => true
    refute nil, jb.head.link.link.link                             # => false
    assert_equal "blap", jb.head.link.link.link.data               # => true
    refute nil, jb.head.link.link.link.link                        # => false
    assert_equal "durp", jb.head.link.link.link.link.data          # => true
    refute nil, jb.head.link.link.link.link.link                   # => false
    assert_equal "boop", jb.head.link.link.link.link.link.data     # => true
    refute nil, jb.head.link.link.link.link.link.link              # => false
    assert_equal "do", jb.head.link.link.link.link.link.link.data  # => true
    assert_equal nil, jb.head.link.link.link.link.link.link.link   # => true
  end

  def test_can_find_multiple_beats_in_list
    jb = JungleBeat.new("deep durp burp tee boop")  # => #<JungleBeat:0x007fa7fa299010 @head=#<Node:0x007fa7fa298ef8 @data=nil, @link=#<Node:0x007fa7fa298ed0 @data="deep", @link=#<Node:0x007fa7fa298ea8 @data="durp", @link=#<Node:0x007fa7fa298e80 @data="burp", @link=#<Node:0x007fa7fa298e58 @data="tee", @link=#<Node:0x007fa7fa298e30 @data="boop", @link=nil>>>>>>>

    assert_equal "burp tee boop", jb.find(2, 3)  # => true
  end

  def test_can_find_single_beat_in_list
    jb = JungleBeat.new("deep durp burp tee boop")  # => #<JungleBeat:0x007fa7fa29bec8 @head=#<Node:0x007fa7fa29bdb0 @data=nil, @link=#<Node:0x007fa7fa29bd88 @data="deep", @link=#<Node:0x007fa7fa29bd60 @data="durp", @link=#<Node:0x007fa7fa29bd38 @data="burp", @link=#<Node:0x007fa7fa29bd10 @data="tee", @link=#<Node:0x007fa7fa29bce8 @data="boop", @link=nil>>>>>>>

    assert_equal "burp", jb.find(2,1)  # => true
  end

  def test_can_tell_if_given_beat_is_in_list
    jb = JungleBeat.new("deep durp burp tee boop")  # => #<JungleBeat:0x007fa7fa2939a8 @head=#<Node:0x007fa7fa293890 @data=nil, @link=#<Node:0x007fa7fa293868 @data="deep", @link=#<Node:0x007fa7fa293840 @data="durp", @link=#<Node:0x007fa7fa293818 @data="burp", @link=#<Node:0x007fa7fa2937f0 @data="tee", @link=#<Node:0x007fa7fa2937c8 @data="boop", @link=nil>>>>>>>

    assert_equal true, jb.includes?("burp")  # => true
    assert_equal true, jb.includes?("boop")  # => true
  end

  def test_can_count_number_of_beats_in_list
    jb = JungleBeat.new("deep durp burp tee boop")  # => #<JungleBeat:0x007fa7fa2aa658 @head=#<Node:0x007fa7fa2aa540 @data=nil, @link=#<Node:0x007fa7fa2aa518 @data="deep", @link=#<Node:0x007fa7fa2aa4f0 @data="durp", @link=#<Node:0x007fa7fa2aa4c8 @data="burp", @link=#<Node:0x007fa7fa2aa4a0 @data="tee", @link=#<Node:0x007fa7fa2aa478 @data="boop", @link=nil>>>>>>>

    assert_equal 5, jb.count  # => true
  end

  def test_can_count_number_of_beats_in_single_beat_list
    jb = JungleBeat.new("deep")                           # => #<JungleBeat:0x007fa7fa2a3588 @head=#<Node:0x007fa7fa2a3510 @data=nil, @link=#<Node:0x007fa7fa2a34e8 @data="deep", @link=nil>>>

    assert_equal 1, jb.count  # => true
  end

  def test_can_count_number_of_beats_in_no_beat_list
    jb = JungleBeat.new                               # => #<JungleBeat:0x007fa7fa2a9528 @head=nil>

    assert_equal 0, jb.count  # => true
  end

  def test_can_pop_beats_off_the_list
    jb = JungleBeat.new("deep durp burp tee boop")  # => #<JungleBeat:0x007fa7fa292e90 @head=#<Node:0x007fa7fa292d78 @data=nil, @link=#<Node:0x007fa7fa292d50 @data="deep", @link=#<Node:0x007fa7fa292d28 @data="durp", @link=#<Node:0x007fa7fa292d00 @data="burp", @link=#<Node:0x007fa7fa292cd8 @data="tee", @link=#<Node:0x007fa7fa292cb0 @data="boop", @link=nil>>>>>>>
    assert_equal "tee boop", jb.pop(2)              # => true
  end

  def test_cannot_pop_beats_off_empty_list
    jb = JungleBeat.new                     # => #<JungleBeat:0x007fa7fa29b4a0 @head=nil>

    assert_equal "Cannot pop off any beats!", jb.pop(1)  # => true
  end

  def test_can_output_all_beats_from_list
    jb = JungleBeat.new("deep durp burp tee boop")  # => #<JungleBeat:0x007fa7fa290370 @head=#<Node:0x007fa7fa290258 @data=nil, @link=#<Node:0x007fa7fa290230 @data="deep", @link=#<Node:0x007fa7fa290208 @data="durp", @link=#<Node:0x007fa7fa2901e0 @data="burp", @link=#<Node:0x007fa7fa2901b8 @data="tee", @link=#<Node:0x007fa7fa290190 @data="boop", @link=nil>>>>>>>

    assert_equal "deep durp burp tee boop", jb.all  # => true
  end

  def test_can_output_beat_from_single_beat_list
    jb = JungleBeat.new("deep")                   # => #<JungleBeat:0x007fa7fa29af50 @head=#<Node:0x007fa7fa29aed8 @data=nil, @link=#<Node:0x007fa7fa29aeb0 @data="deep", @link=nil>>>

    assert_equal "deep", jb.all  # => true
  end

  def test_can_play
    jb = JungleBeat.new("ding dah oom oom ding oom oom oom ding dah oom oom ding dah oom oom ding")  # => #<JungleBeat:0x007fa7fa2a17d8 @head=#<Node:0x007fa7fa2a14e0 @data=nil, @link=#<Node:0x007fa7fa2a14b8 @data="ding", @link=#<Node:0x007fa7fa2a1490 @data="dah", @link=#<Node:0x007fa7fa2a1468 @data="oom", @link=#<Node:0x007fa7fa2a1440 @data="oom", @link=#<Node:0x007fa7fa2a1418 @data="ding", @link=#<Node:0x007fa7fa2a13f0 @data="oom", @link=#<Node:0x007fa7fa2a13c8 @data="oom", @link=#<Node:0x007fa7fa2a13a0 @data="oom", @link=#<Node:0x007fa7fa2a1378 @data="ding", @link=#<Node:0x007fa7fa2a1350 @data="dah", @link=#<Node:0x007fa7fa2a1328 @data="oom", @link=#<Node:0x007fa7fa2a1300 @data="oom", @link=#<Node:0x007fa7fa2a12d8 @data="ding", @link=#<Node:0x007fa7fa2a12b0 @data="dah", @link=#<Node:0x007fa7fa2a1288 @data="oom", @link=#<Node:0x007fa7fa2a1260 @data="oom", @link=#<Node:0x007fa7fa2a1238 @data="ding", @link=nil>>>>>>>>>>>>>>>>>>>

    jb.play  # => "ding dah oom oom ding oom oom oom ding dah oom oom ding dah oom oom ding"
  end
end

# >> Run options: --seed 63287
# >>
# >> # Running:
# >>
# >> .5
# >> "tee boop"
# >> ...5
# >> "deep durp burp tee boop"
# >> ."burp"
# >> ."Cannot pop off any beats!"
# >> .1
# >> "deep"
# >> ..."burp tee boop"
# >> ...1
# >> ....17
# >> "ding dah oom oom ding oom oom oom ding dah oom oom ding dah oom oom ding"
# >> ...5
# >> .....S.
# >>
# >> Finished in 0.002209s, 12223.8264 runs/s, 31691.4018 assertions/s.
# >>
# >> 27 runs, 70 assertions, 0 failures, 0 errors, 1 skips
# >>
# >> You have skipped tests. Run with --verbose for details.
