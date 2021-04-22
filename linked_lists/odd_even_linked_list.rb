# Given the head of a singly linked list, group all the nodes with odd indices
# together followed by the nodes with even indices, and return the reordered list.
# The first node is considered odd, and the second node is even, and so on.
# Note that the relative order inside both the even and odd groups should
# remain as it was in the input.

# Complexity Analysis
#
# Time complexity: O(n). There are total nn nodes and we visit each node once.
# Space complexity: O(1). All we need is the four pointers.

def odd_even_list(head)
  return nil if head == nil
  return head if head.next == nil or head.next.next == nil

  odd = head
  even = head.next
  evenFirst = even

  while true
    if even.nil? || even.next.nil?
      odd.next = evenFirst
      break
    end

    odd.next = even.next
    odd = even.next

    even.next = odd.next
    even = odd.next
  end

  head
end

# Input: head = [1,2,3,4,5]
# Output: [1,3,5,2,4]

# Input: head = [2,1,3,5,6,4,7]
# Output: [2,3,6,7,1,5,4]
