# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end

# Approach #1 (Iterative)

# Time complexity: O(n). Assume that nn is the list's length, the time complexity is O(n).
# Space complexity: O(1).

# @param {ListNode} head
# @return {ListNode}
def reverse_list(head)
  return nil if head.nil?

  prev = nil
  current = head

  until current.nil?
    next_temp = current.next
    current.next = prev
    prev = current
    current = next_temp
  end

  prev
end

# Input: 1->2->3->4->5->NULL
# Output: 5->4->3->2->1->NULL

# Approach #2 (Recursive)

# Time complexity: O(n). Assume that nn is the list's length, the time complexity is O(n).
# Space complexity: O(n). The extra space comes from implicit stack space due to recursion.
# The recursion could go up to nn levels deep.

def reverse_list(head)
  return head if head.nil? || head.next.nil?

  p = reverse_list(head.next)
  head.next.next = head
  head.next = nil

  p
end
