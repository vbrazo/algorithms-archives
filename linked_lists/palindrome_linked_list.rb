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

  while iterator do
    array.push(iterator.val)
    iterator = iterator.next
  end

  array == array.reverse
end
