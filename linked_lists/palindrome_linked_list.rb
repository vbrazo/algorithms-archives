# Given the head of a singly linked list, return true if it is a palindrome.
#
# Example 1:
#
#
# Input: head = [1,2,2,1]
# Output: true
# Example 2:
#
#
# Input: head = [1,2]
# Output: false
#
#
# Constraints:
#
# The number of nodes in the list is in the range [1, 105].
# 0 <= Node.val <= 9
#
#
# Follow up: Could you do it in O(n) time and O(1) space?

# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end

#
# Approach 1: Brute force
#

# Brute force
# O(n) time
# O(n) space

def is_palindrome(head)
  array = []
  iterator = head

  while iterator
    array.push(iterator.val)
    iterator = iterator.next
  end

  array == array.reverse
end

#
# Approach 2: Reverse Second Half In-place
#

# Complexity Analysis
#
# Time complexity: O(n), where n is the number of nodes in the Linked List.
#
# Similar to the above approaches. Finding the middle is O(n), reversing a
# list in place is O(n), and then comparing the 2 resulting Linked Lists is
# also O(n).
#
# Space complexity: O(1).
#
# We are changing the next pointers for half of the nodes. This was all memory
# that had already been allocated, so we are not using any extra memory and
# therefore it is O(1).

def is_palindrome(head)
  return true if head.nil? || head.next.nil?

  dummy_head = ListNode.new(0, head)

  # Find the middle of the linked list
  slow_iterator = dummy_head
  fast_iterator = head
  while fast_iterator && fast_iterator.next
    slow_iterator = slow_iterator.next
    fast_iterator = fast_iterator.next.next
  end

  # Break the linked list in half
  head_of_second_half = fast_iterator.nil? ? slow_iterator.next : slow_iterator.next.next
  initial_tail_of_first_half = slow_iterator
  next_node_from__tail_of_first_half = slow_iterator.next
  slow_iterator.next = nil

  # Reverse the first half of the linked list
  reverse_linked_list(head)

  # Compare halves for equality
  first_half_iterator = initial_tail_of_first_half
  second_half_iterator = head_of_second_half
  is_palindrome = true

  while first_half_iterator || second_half_iterator
    if first_half_iterator.nil? || second_half_iterator.nil?
      is_palindrome = false
      break
    elsif first_half_iterator.val != second_half_iterator.val
      is_palindrome = false
      break
    end

    first_half_iterator = first_half_iterator.next
    second_half_iterator = second_half_iterator.next
  end

  # Repair the linked list
  reverse_linked_list(initial_tail_of_first_half)
  initial_tail_of_first_half.next = next_node_from__tail_of_first_half

  is_palindrome
end

def reverse_linked_list(head)
  return if head.nil?

  first_iterator = nil
  second_iterator = head
  third_iterator = head.next

  while second_iterator
    second_iterator.next = first_iterator

    first_iterator = second_iterator
    second_iterator = third_iterator
    third_iterator = third_iterator&.next
  end

  second_iterator
end

#
# Approach 3: Recursion
#

# Complexity Analysis
#
# Time complexity: O(n), where nn is the number of nodes in the Linked List.
# The recursive function is run once for each of the n nodes, and the body
# of the recursive function is O(1). Therefore, this gives a total of O(n).
#
# Space complexity: O(n), where n is the number of nodes in the Linked List.
# I hinted at the start that this is not using O(1) space. This might seem
# strange, after all we aren't creating any new data structures. So, where is
# the O(n) extra memory we're using? Understanding what is happening here
# requires understanding how the computer runs a recursive function.

# Each time a function is called within a function, the computer needs to keep
# track of where it is up to (and the values of any local variables) in the
# current function before it goes into the called function. It does this by
# putting an entry on something called the runtime stack, called a stack frame.
# Once it has created a stack frame for the current function, it can then go into
# the called function. Then once it is finished with the called function, it pops
# the top stack frame to resume the function it had been in before the function
# call was made.
#
# Before doing any palindrome checking, the above recursive function creates n
# of these stack frames because the first step of processing a node is to process
# the nodes after it, which is done with a recursive call. Then once it has the n
# stack frames, it pops them off one-by-one to process them.
#
# So, the space usage is on the runtime stack because we are creating nn stack
# frames. Always make sure to consider what's going on the runtime stack when
# analyzing a recursive function. It's a common mistake to forget to.
#
# Not only is this approach still using O(n) space, it is worse than the
# first approach because in many languages (such as Python), stack frames are
# large, and there's a maximum runtime stack depth of 1000 (you can increase it,
# but you risk causing memory errors with the underlying interpreter). With every
# node creating a stack frame, this will greatly limit the maximum Linked List
# size the algorithm can handle.

def is_palindrome(head)
  return true unless head

  @iter_count = 0
  @node = head
  @ret = true

  def recursion(node, count)
    recursion(node.next, count + 1) if node.next

    return if count <= @iter_count

    @ret = false if node.val != @node.val

    @node = @node.next
    @iter_count += 1
  end

  recursion(head, 0)

  @ret
end
