# Given a linked list, swap every two adjacent nodes and return its head.

# Approach 1: Recursive Approach

# Complexity Analysis

# Time Complexity: O(N) where N is the size of the linked list.
# Space Complexity: O(N) stack space utilized for recursion.

# Definition for singly-linked list.
class ListNode
  attr_accessor :val, :next

  def initialize(val = 0, _next = nil)
    @val = val
    @next = _next
  end
end

# @param {ListNode} head
# @return {ListNode}
def swap_pairs(head)
  if !head || !head.next
    return head
  end

  first_node = head
  second_node = head.next

  first_node.next  = swap_pairs(second_node.next)
  second_node.next = first_node

  second_node
end

# Input: head = [1,2,3,4]
# Output: [2,1,4,3]

# Input: head = []
# Output: []

# Input: head = [1]
# Output: [1]
