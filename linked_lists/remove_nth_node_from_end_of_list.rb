# Given the head of a linked list, remove the nth node from the end of the list and return its head.

#
# Input: head = [1,2,3,4,5], n = 2
# Output: [1,2,3,5]
#
# Input: head = [1], n = 1
# Output: []
#
# Input: head = [1,2], n = 1
# Output: [1]
#

# Approach 1: Two pass algorithm

# Intuition

# We notice that the problem could be simply reduced to another one:
# Remove the (L - n + 1)th node from the beginning in the list,
# where L is the list length. This problem is easy to solve
# once we found list length L.

# Algorithm

# First we will add an auxiliary "dummy" node, which points to the list head.
# The "dummy" node is used to simplify some corner cases such as a list with
# only one node, or removing the head of the list. On the first pass, we find
# the list length LL. Then we set a pointer to the dummy node and start to move
# it through the list till it comes to the (L - n)th node. We relink next
# pointer of the (L - n) th node to the (L - n + 2) th node and
# we are done.

# Complexity Analysis
#
# Time complexity: O(L).
#
# The algorithm makes two traversal of the list, first to calculate list
# length L and second to find the (L - n)th node. There are 2L-n operations
# and time complexity is O(L).
#
# Space complexity: O(1).
#
# We only used constant extra space.

# Definition for singly-linked list.
class ListNode
  attr_accessor :val, :next

  def initialize(val = 0, _next = nil)
    @val = val
    @next = _next
  end
end

# @param {ListNode} head
# @param {Integer} n
# @return {ListNode}
def remove_nth_from_end(head, n)
  len = 0
  start = head

  until start.nil?
    len += 1
    start = start.next
  end

  p len
  delete_idx = len - n
  p delete_idx

  return head.next if delete_idx == 0

  pointer = head
  idx = 0

  while idx < (delete_idx - 1)
    pointer = pointer.next
    idx += 1
  end

  pointer.next = pointer.next.next

  head
end
