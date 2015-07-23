require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/linked_list'

class LinkedListTest < Minitest::Test
 def test_it_has_a_class
   assert LinkedList
 end

 def test_new_linked_list_is_initialized_with_head
   my_list = LinkedList.new(5)
   assert_equal 5, my_list.head.value
 end

 def test_new_linked_list_is_initialize_with_other_head
   my_list = LinkedList.new(6)
   assert_equal 6, my_list.head.value
 end

 def test_append_method_will_add_node_to_end_of_linked_list
   my_list = LinkedList.new(6)
   my_list.append(7)
   assert_equal 7, my_list.head.next_node.value
 end

 def test_tail_is_found
  my_list = LinkedList.new(6)
  my_list.append(8)
  assert_equal 8, my_list.tail.value
 end

 def test_a_list_knows_its_head
  my_list = LinkedList.new("kitten")
  assert_equal "kitten", my_list.head.value
 end

 def test_head_is_the_tail_with_one_item_list
  list = LinkedList.new("kitten")
  assert_equal "kitten", list.tail.value
 end

 def test_prepend_one_thing
    list = LinkedList.new("kitten")
    refute list.head.nil?
    list.prepend "puppy"
    assert_equal "puppy", list.head.value
 end

 def test_prepend_two_things
    list = LinkedList.new("kitten")
    refute list.head.nil?
    list.prepend("up")
    list.prepend("shut")
    assert_equal "shut", list.head.value
    assert_equal "up", list.head.next_node.value
 end

 def test_it_pops
    list = LinkedList.new("hotdog")
    list.append("hamburger")
    popped_node = list.pop
    assert_equal "hamburger", popped_node.value
    assert_equal nil, list.head.next_node
 end

  def test_it_pops_when_three_items_are_in_list
    list = LinkedList.new("hotdog")
    list.append("hamburger")
    list.append("fries")
    popped_node = list.pop
    assert_equal "fries", popped_node.value
    refute list.head.next_node.next_node
  end

  def test_includes_returns_a_true_value
    list = LinkedList.new("hotdog")
    list.includes?("hotdog")
    assert_equal list.includes?("hotdog"), true
  end

  def test_includes_returns_a_false_value
    list = LinkedList.new("hotdog")
    list.append("hamburger")
    list.append("fries")
    assert_equal list.includes?("tomato"), false
  end



  def test_it_finds_the_value_at_a_given_index
    list = LinkedList.new("cello")
    list.append("singer")
    list.append("horn")
    assert_equal "horn", list.find_by_index(2)
  end

  def test_it_returns_nil_if_there_is_not_a_node_at_given_index
    list = LinkedList.new("cello")
    list.append("singer")
    list.append("horn")
    assert_nil list.find_by_index(4)
  end

  def test_new_node_will_insert_at_a_desired_position
    list = LinkedList.new("cello")
    list.append("violin")
    list.append("piano")
    list.insert(2,(Node.new("singer")))
    assert_equal "singer", list.head.next_node.next_node.value
  end

  def test_it_returns_the_value_at_the_beginning_of_the_list
    list = LinkedList.new("cello")
    list.append("violin")
    list.append("piano")
    list.return_head
    assert_equal "cello", list.return_head
  end

  def test_it_returns_the_value_at_the_end_of_the_list
    list = LinkedList.new("cello")
    list.append("violin")
    list.append("piano")
    list.return_tail
    assert_equal "piano", list.return_tail
  end

  def test_when_linked_list_only_has_one_value
    list = LinkedList.new("Fat Tire")

    assert_equal "Fat Tire", list.return_tail
    assert_equal "Fat Tire", list.return_head
  end

  def test_it_can_count_number_of_nodes_in_list

    list = LinkedList.new("Fat Tire")
    list.append("Dales Pale Ale")
    list.append("Milk Stout")
    assert_equal 3, list.count
  end

  def test_it_can_delete_a_node_by_index
    list = LinkedList.new("Fat Tire")
    list.append("Dales Pale Ale")
    list.append("Milk Stout")
    assert_equal "Milk Stout", list.delete_by_index(2)
    assert_equal ["Fat Tire", "Dales Pale Ale"], list.to_a
  end

  def test_find_by_value
    list = LinkedList.new("Fat Tire")
    list.append("Dales Pale Ale")
    list.append("Milk Stout")
    assert_equal 1, list.find_by_value("Dales Pale Ale")
  end

  def test_remove_by_value_removes_a_node_with_given_value
    list = LinkedList.new("Fat Tire")
    list.append("Dales Pale Ale")
    list.append("Milk Stout")
    list.remove_by_value("Dales Pale Ale")
    assert_equal ["Fat Tire", "Milk Stout"], list.to_a
  end
    
end
