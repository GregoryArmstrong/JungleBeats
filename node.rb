class Node

  attr_accessor :link, :data
  
  def initialize(data=nil, link=nil)
    @data = data
    @link = link
  end

  def data
    @data
  end

  def link
    @link
  end

  def reassign_link(string)
    @link = string
  end


end
