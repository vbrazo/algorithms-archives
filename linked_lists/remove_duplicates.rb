# Given the head of a sorted linked list, delete all nodes that have
# duplicate numbers, leaving only distinct numbers from the original list.
# Return the linked list sorted as well.

# Input: head = [1,2,3,3,4,4,5]
# Output: [1,2,5]

# Input: head = [1,1,1,2,3]
# Output: [2,3]

#
# Approach 1: Sentinel Head + Predecessor
#

# Complexity Analysis

# Time complexity: O(N) since it's one pass along the input list.
# Space complexity: O(1) because we don't allocate any additional data structure.

def delete_duplicates(head)
  return nil if head.nil?

  sentinel = ListNode.new(0)
  sentinel.next = head

  pred = sentinel
  current = head

  while head
    if head.next and head.val == head.next.val
      while head.next and head.val == head.next.val
        head = head.next
      end

      pred.next = head.next
    else
      pred = pred.next
    end

    head = head.next
  end

  sentinel.next
end
