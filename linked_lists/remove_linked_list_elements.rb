# Remove all elements from a linked list of integers that have value val.

# Approach 1: Sentinel Node

# Sentinel nodes are widely used in trees and linked lists as pseudo-heads,
# pseudo-tails, markers of level end, etc. They are purely functional, and
# usually does not hold any data. Their main purpose is to standardize the situation,
# for example, make linked list to be never empty and never headless and hence simplify
# insert and delete.

# Algorithm
# Initiate sentinel node as ListNode(0) and set it to be the new head: sentinel.next = head.
# Initiate two pointers to track the current node and its predecessor: curr and prev.
# While curr is not a null pointer:
# Compare the value of the current node with the value to delete.
# In the values are equal, delete the current node: prev.next = curr.next.
# Otherwise, set predecessor to be equal to the current node.
# Move to the next node: curr = curr.next.
# Return sentinel.next.

# Time complexity: O(N), it's one pass solution.
# Space complexity: O(1), it's a constant space solution.

def remove_elements(head, val)
  return nil if head.nil?

  sentinel = ListNode.new(0)
  sentinel.next = head

  prev = sentinel
  current = head

  while current != nil
    if current.val == val
        prev.next = current.next
    else
        prev = current
    end
    current = current.next
  end

  sentinel.next
end

remove_elements(head, 6)
# Input:  1->2->6->3->4->5->6, val = 6
# Output: 1->2->3->4->5
