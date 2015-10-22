require_relative './node'  # => true

class JungleBeat

  attr_accessor :head  # => nil

  def initialize(beat=nil, head=nil)
    @head = head
    if beat
      create_initial_head(beat)
    end
  end

  def create_initial_head(string)
    split_string = string.split
    @head = Node.new(nil)
    current_node = @head
    split_string.each do |x|
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
      create_initial_head(string)
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
    puts "Beats appended."
  end

  def prepend(string)
    if @head == nil
      create_initial_head(string)
    else
      stored_head_link = @head.link
      create_initial_head(string)
      find_tail.link = stored_head_link
    end
    puts "Beats prepended."
  end

  def insert(position, string)
    if @head == nil
      create_initial_head(string)
    else
      current_node = @head.link
      (position - 1).times do
        current_node = current_node.link
      end
      stored_post_insert_link = current_node.link
      split_string = string.split
      split_string.each do |x|
        current_node.link = Node.new(x)
        current_node = current_node.link
      end
      find_tail.link = stored_post_insert_link
    end
    puts "Beats inserted."
  end

  def find(position, number_of_elements)
    current_node = @head.link
    (position).times do
      current_node = current_node.link
    end
    output = []
    (number_of_elements).times do
      output << current_node.data
      current_node = current_node.link
    end
    p output.join(" ")
  end

  def includes?(string)
    current_node = @head.link
    while current_node.link != nil
      if current_node.data == string
        return true
      end
      current_node = current_node.link
    end
    if current_node.data == string
      return true
    end
  end

  def count
    if @head == nil
      return 0
    else
      current_node = @head.link
      counter = 0
      while current_node.link != nil
        counter += 1
        current_node = current_node.link
      end
      p counter + 1
    end
  end

  def pop(number)
    if @head == nil
      p "Cannot pop off any beats!"
    else
      position = count - number
      current_node = @head.link
      (position - 1).times do
        current_node = current_node.link
      end
      stored_rest_of_data = current_node.link
      current_node.link = nil
      output = []
      number.times do
        output << stored_rest_of_data.data
        stored_rest_of_data = stored_rest_of_data.link
      end
      p output.join(" ")
    end
  end

  def all
    current_node = @head.link
    output = []
    (count).times do
      output << current_node.data
      current_node = current_node.link
    end
    p output.join(" ")
  end

  def play
    puts "Playing beat!"
    p `say -v Boing #{all}`
  end

end
