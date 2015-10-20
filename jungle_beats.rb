require_relative './node'

class JungleBeat

  def initialize(beat=nil, next_node=nil)
    @beat = beat
    @next_node = next_node
  end

  # def play
  #   split_beat = @beat.split
  #   split_beat.each_with_index do |x, i|
  #     x = Node.new(split_beat[i], split_beat[(i + 1)])
  #     p x.object_id
  #     p @beat
  #     p @next_node
  #   end
  # end

  def beat
    @beat
  end

  def next_node
    @next_node
  end

  def head?
    if @next_node == nil
      return true
    end
  end

  def all
    @beat
  end

  def count
    if @beat == nil
      return 0
    else
      count = @beat.split
      count.size
    end
  end

  def append(string)
    if @beat == nil
      @beat = string
    else
      split_beat = @beat.split
      split_beat << string
      @beat = split_beat.join(" ")
    end
  end

  def prepend(string)
    if @beat == nil
      @beat = string
    else
      split_beat = @beat.split
      split_beat.unshift(string)
      @beat = split_beat.join(" ")
    end
  end

  def insert(string, position=-1)
    if @beat == nil
      @beat = string
    else
      split_beat = @beat.split
      split_beat.insert(position, string)
      @beat = split_beat.join(" ")
    end
  end

  def pop(n=1)
    if @beat == nil
      return nil
    else
      split_beat = @beat.split
      split_beat.pop(n)
      @beat = split_beat.join(" ")
    end
  end

  # def find(index=0, number=1)
  #   if @beat == nil
  #     return nil
  #   else
  #     split_beat = @beat.split
  #     return split_beat.select{ |index, number| split_beat[index..(index + number)]}
  #     @beat = split_beat.join(" ")
  #   end
  # end

end
