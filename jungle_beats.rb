require_relative './node'  # => true

class JungleBeat

  attr_accessor :head  # => nil

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
    return current_node
  end

  def append(string)
    if @head == nil
      @head = Node.new
      @head.link = Node.new(string)
    else
      split_string = string.split
      split_string.each do |x|
        current_node = @head.link
        while current_node.link != nil
          current_node = current_node.link
        end
        current_node.link = Node.new(x)
        current_node = current_node.link
      end
    end
  end

end
