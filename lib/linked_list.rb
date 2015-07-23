require_relative 'cnode'

class LinkedList

  attr_reader :head
  include Enumerable
   def initialize(initial_value)
     @head = Node.new(initial_value)
     #@head means make the instance variable called head
     #what we put in head is always going to be a Node.new
     #with the initial value
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

   def pop
     current_node = @head
    while current_node.next_node.next_node
        current_node = current_node.next_node
    end
    tail_node = current_node.next_node
    current_node.next_node=nil
    tail_node
     # the pop method does 3 things
     # 1) Find the next to last node.
     # 2) Take ^ node and reassign ".next_node" to eq nil
     # 3) Return that "next_node"
   end

   alias :includes? :include?

   def insert(desired_position, new_node)
     node = find_node_by_index(desired_position - 1)
     new_node.next_node = node.next_node
     node.next_node = new_node
   end

   def find_node_by_index(index)
     current_node = @head
     position = 0
     while position != index && current_node
        current_node = current_node.next_node
        position += 1
     end
     current_node
   end

   def find_by_index(index)
     found_node = find_node_by_index(index)
     found_node && found_node.value
   end

   def return_head
     head.value
   end

   def return_tail
     tail.value
   end

   def each
     return enum_for(:each) unless block_given?

     each_node do |node|
       yield node.value
     end
   end

   def each_node
     return enum_for(:each_node) unless block_given?
     current_node = @head
     while current_node
       yield current_node
       current_node = current_node.next_node
     end
   end

   def find_by_value(value)
     each_with_index do |val, i|
       if value == val
         return i
       end
     end
     nil
   end

   def delete_by_index(index)
     val = nil
     if index == 0
       @head = @head.next_node
       @head.value
     else
       each_node.with_index do |node, i|
         if i == index - 1 && node.next_node
           node_after = node.next_node.next_node
           val = node.next_node.value
           node.next_node = node_after
         end
       end
     end
     val
   end

   def remove_by_value(value)
     each_node.with_index do |node, index|
       if index.zero? && node.value == value
         @head == node.next_node
         return
       end
        if node.next_node && node.next_node.value == value
          node_after = node.next_node.next_node
          node.next_node = node_after
          return
        end
     end
   end

end
