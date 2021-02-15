# Write a program to find the node at which the intersection of
# two singly linked lists begins.

# Approach 1: Brute Force
#
# For each node ai in list A, traverse the entire list B and
# check if any node in list B coincides with ai.
#
# Complexity Analysis
#
# Time complexity: O(m*n).
# Space complexity: O(1).

# Approach 2: Hash Table

# Traverse list A and store the address / reference to each node in a hash set.
# Then check every node bi in list B: if bi appears in the hash set,
# then bi is the intersection node.
#
# Complexity Analysis
#
# Time complexity: O(m+n).
#
# Space complexity: O(m) or O(n).

# Approach 3: Two Pointers

# Maintain two pointers pA and pB initialized at the head of A and B,
# respectively. Then let them both traverse through the lists, one node
# at a time. When pA reaches the end of a list, then redirect
# it to the head of B (yes, B, that's right.); similarly when pB
# reaches the end of a list, redirect it the head of A.
# If at any point pA meets pB, then pA/pB is the intersection node.
# To see why the above trick would work, consider the following two lists:
# A = {1,3,5,7,9,11} and B = {2,4,9,11}, which are intersected at node '9'.
# Since B.length (=4) < A.length (=6), pB would reach the end of the
# merged list first, because pB traverses exactly 2 nodes less than
# pA does. By redirecting pB to head A, and pA to head B,
# we now ask pB to travel exactly 2 more nodes than pA would.
# So in the second iteration, they are guaranteed to reach the intersection
# node at the same time. If two lists have intersection,
# then their last nodes must be the same one.
# So when pA/pB reaches the end of a list, record the last element
# of A/B respectively. If the two last elements are not the same one,
# then the two lists have no intersections.
#
# Complexity Analysis
#
# Time complexity: O(m+n).
# Space complexity: O(1).

class ListNode
  attr_accessor :val, :next

  def initialize(val)
    @val = val
    @next = nil
  end
end

# @param {ListNode} headA
# @param {ListNode} headB
# @return {ListNode}
def getIntersectionNode(headA, headB)
  return nil if headA.nil? || headB.nil?

  node_a = headA
  node_b = headB

  while node_a != node_b
    node_a = if node_a.nil?
               headB
             else
               node_a.next
             end

    node_b = if node_b.nil?
               headA
             else
               node_b.next
             end
  end

  node_a
end

listA = [4, 1, 8, 4, 5]
listB = [5, 6, 1, 8, 4, 5]
getIntersectionNode(listA, listB)
# Output: Reference of the node with value = 8

# Input Explanation: The intersected node's value is 8
# (note that this must not be 0 if the two lists intersect).
# From the head of A, it reads as [4,1,8,4,5]. From the head of B,
# it reads as [5,6,1,8,4,5]. There are 2 nodes before the intersected node
# in A; There are 3 nodes before the intersected node in B.

listA = [1, 9, 1, 2, 4]
listB = [3, 2, 4]
getIntersectionNode(listA, listB)
# Output: Reference of the node with value = 2

# Input Explanation: The intersected node's value is 2
# (note that this must not be 0 if the two lists intersect).
# From the head of A, it reads as [1,9,1,2,4]. From the head of B,
# it reads as [3,2,4]. There are 3 nodes before the intersected node in A;
# There are 1 node before the intersected node in B.

listA = [2, 6, 4]
listB = [1, 5]
getIntersectionNode(listA, listB)
# => null

# Input Explanation: From the head of A, it reads as [2,6,4].
# From the head of B, it reads as [1,5]. Since the two lists do not intersect,
# intersectVal must be 0, while skipA and skipB can be arbitrary values.
# Explanation: The two lists do not intersect, so return null.
