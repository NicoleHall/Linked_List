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
    skip
    list = LinkedList.new("hotdog")
    list.append("hamburger")
    actual = list.pop
    assert_equal "hamburger", actual.value
    refute list.head.next_node
  end

  def test_it_pops_when_three_items_are_in_list
    skip
    list = LinkedList.new("hotdog")
    list.append("hamburger")
    list.append("fries")
    actual = list.pop
    assert_equal "fries", actual.value
    refute list.head.next_node
  end


end
