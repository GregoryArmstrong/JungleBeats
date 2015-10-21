require_relative './node'

class JungleBeat

  attr_accessor :head

  def initialize(beat=nil, head=nil)
    @head = head
    if beat
      create_initial_head(beat)
    end
  end

  def create_initial_head(beat)
    split_beat = beat.split
    @head = Node.new(nil)
    current_node = @head
    split_beat.each do |x|
      current_node.link = Node.new(x)
      current_node = current_node.link
    end
  end

  def find_head
    @head
  end

  def find_tail
    current_node = @head.link
    while current_node.link != nil
      current_node = current_node.link
    end
    if current_node.link == nil
      return current_node
    end
  end
end
