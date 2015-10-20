require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './jungle_beats'

class JungleBeatsTest < Minitest::Test

  def test_has_no_beat_to_start
    jb = JungleBeat.new

    refute nil, jb.beat
  end

  def test_starting_node_is_head
    jb = JungleBeat.new

    assert true, jb.next_node
  end

  def test_has_head_with_one_beat
    jb = JungleBeat.new("deep")

    assert true, jb.next_node
  end

  def test_can_call_all_on_jungle_beat_to_start
    jb = JungleBeat.new

    refute nil, jb.all
  end

  def test_can_call_all_on_jungle_beat_with_beat
    jb = JungleBeat.new("deep dep dep deep")

    assert_equal "deep dep dep deep", jb.all
  end

  def test_can_return_count_without_a_beat
    jb = JungleBeat.new

    assert_equal 0, jb.count
  end

  def test_can_return_count_with_a_beat
    jb = JungleBeat.new("deep dep dep deep")

    assert_equal 4, jb.count
  end

  def test_can_append_beat_to_list_with_no_beat
    jb = JungleBeat.new
    jb.append("deep")

    assert_equal "deep", jb.beat
  end

  def test_can_append_beat_to_list_with_beat
    jb = JungleBeat.new("deep dep dep deep")
    jb.append("deep")

    assert_equal "deep dep dep deep deep", jb.beat
  end

  def test_can_prepend_beat_to_list_with_no_beat
    jb = JungleBeat.new
    jb.prepend("deep")

    assert_equal "deep", jb.beat
  end

  def test_can_prepend_beat_to_list_with_beat
    jb = JungleBeat.new("deep dep dep deep")
    jb.prepend("deep")

    assert_equal "deep deep dep dep deep", jb.beat
  end

  def test_can_insert_beat_to_list_with_no_beat
    jb = JungleBeat.new
    jb.insert("deep")

    assert_equal "deep", jb.beat
  end

  def test_can_insert_beat_to_last_position_on_list_with_a_beat
    jb = JungleBeat.new("deep dep dep deep")
    jb.insert("deep", -1)

    assert_equal "deep dep dep deep deep", jb.beat
  end

  def test_can_insert_beat_to_specified_position_on_list_with_a_beat
    jb = JungleBeat.new("deep dep dep deep")
    jb.insert("deep", -3)

    assert_equal "deep dep deep dep deep", jb.beat
  end

  def test_cannot_pop_with_no_beat
    jb = JungleBeat.new
    jb.pop

    assert_equal nil, jb.beat
  end

  def test_can_pop_with_a_beat
    jb = JungleBeat.new("deep dep dep deep")
    jb.pop

    assert_equal "deep dep dep", jb.beat
  end

  def test_can_pop_multiple_elements_with_a_beat
    jb = JungleBeat.new("deep dep dep deep")
    jb.pop(2)

    assert_equal "deep dep", jb.beat
  end

  # def test_can_find_a_single_element_in_beat
  #   jb = JungleBeat.new("deep dep dep deep")
  #
  #   assert_equal "dep", jb.find(1, 1)
  # end
end
