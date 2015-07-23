class Node

  attr_accessor :value, :next_node

  def initialize(value)#you'll never have a next node when creating a new node
    @value = value
    @next_node = nil
  end

end
