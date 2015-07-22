class LinkedList
   def initialize(initial_value)
     @head = Node.new(initial_value)
     #@head means make the instance variable called head
     #what we put in head is always going to be a Node.new
     #with the initial value
   end

   def head
     @head
   end

   def append(new_value)
       current_node = @head#think of the variable assignment as throw away data, it does not exist outside of this method.
     while current_node.next_node
       #while current node has a buddy,
       #consider the buddy to be the new
       #current node
          current_node = current_node.next_node
          #now we're re-assigning current node
      end
      current_node.next_node = Node.new(new_value)
   end

   def tail
     current_node = @head
   while current_node.next_node
     #while current node has a buddy,
     #consider the buddy to be the new
     #current node
        current_node = current_node.next_node
    end
    #we now know the current node is the last in the list,
    # how do we get it to return its value
    current_node 
   end

   def prepend(value)
    prepend_node = Node.new(value)
    prepend_node.next_node = @head
    @head = prepend_node
   end

end

class Node

  attr_accessor :value, :next_node

  def initialize(value)#you'll never have a next node when creating a new node
    @value = value
    @next_node = nil
  end

end
