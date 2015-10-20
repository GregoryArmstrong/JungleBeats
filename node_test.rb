require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './node'

class NodeTest < Minitest::Test

  def test_has_no_data_to_start
    node = Node.new

    refute nil, node.data
  end

  def test_has_no_link_to_start
    node = Node.new

    refute nil, node.link
  end

  def test_can_reassign_link
    node = Node.new
    node.reassign_link("test")

    assert_equal "test", node.link
  end

end
