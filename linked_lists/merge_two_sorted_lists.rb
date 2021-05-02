# Merge two sorted linked lists and return it as a sorted list. The list should be made by splicing together the nodes of the first two lists.
#
# Example 1:
#
#
# Input: l1 = [1,2,4], l2 = [1,3,4]
# Output: [1,1,2,3,4,4]
#
# Example 2:
#
# Input: l1 = [], l2 = []
# Output: []
#
# Example 3:
#
# Input: l1 = [], l2 = [0]
# Output: [0]

#
# Approach 1: Recursion
#

# Complexity Analysis
#
# Time complexity : O(n + m)
# Because each recursive call increments the pointer to l1 or l2 by one (approaching the dangling null at the end of each list), there will be exactly one call to mergeTwoLists per element in each list. Therefore, the time complexity is linear in the combined size of the lists.
#
# Space complexity : O(n + m)
# The first call to mergeTwoLists does not return until the ends of both l1 and l2 have been reached, so n + mn+m stack frames consume O(n + m) space.

def merge_two_lists(l1,l2)
  return l1 unless l2
  return l2 unless l1

  ## swap
  if l1.val > l2.val
    l1, l2 = l2, l1
  end

  l1.next = merge_two_lists(l1.next, l2)

  l1
end

#
# Approach 2: Iteration
#

# Complexity Analysis
#
# Time complexity: O(n + m)
# Because exactly one of l1 and l2 is incremented on each loop iteration, the while loop runs for a number of iterations equal to the sum of the lengths of the two lists. All other work is constant, so the overall complexity is linear.
#
# Space complexity: O(1)
# The iterative approach only allocates a few pointers, so it has a constant overall memory footprint.

class ListNode
  attr_accessor :val, :next

  def initialize(val = 0, _next = nil)
    @val = val
    @next = _next
  end
end

def merge_two_lists(l1, l2)
  dummy_head = ListNode.new
  iterator = dummy_head

  while l1 && l2
    if l1.val < l2.val
      iterator.next = l1
      l1 = l1.next
    else
      iterator.next = l2
      l2 = l2.next
    end

    iterator = iterator.next
  end

  iterator.next = l1.nil? ? l2 : l1

  dummy_head.next
end
