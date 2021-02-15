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

# Approach 2: Iterative Approach

# Intuition

# The concept here is similar to the recursive approach.
# We break the linked list into pairs by jumping in steps of two.
# The only difference is, unlike recursion, we swap the nodes on the go.
# After swapping a pair of nodes, say A and B, we need to link the node B
# to the node that was right before A. To establish this linkage we save
# the previous node of node A in prevNode.

# Complexity Analysis

# Time Complexity: O(N) where N is the size of the linked list.
# Space Complexity: O(1).

# @param {ListNode} head
# @return {ListNode}
def swap_pairs(head)
  dummy = ListNode.new(-1)
  dummy.next = head

  prev_node = dummy

  while head and head.next
    # Nodes to be swapped
    first_node = head
    second_node = head.next

    # Swapping
    prev_node.next = second_node
    first_node.next = second_node.next
    second_node.next = first_node

    # Reinitializing the head and prev_node for next swap
    prev_node = first_node
    head = first_node.next
  end

  # Return the new head node
  dummy.next
end

# Input: head = [1,2,3,4]
# Output: [2,1,4,3]

# Input: head = []
# Output: []

# Input: head = [1]
# Output: [1]
