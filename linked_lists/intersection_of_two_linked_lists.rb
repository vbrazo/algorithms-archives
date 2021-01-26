# Write a program to find the node at which the intersection of
# two singly linked lists begins.

# class ListNode
#   attr_accessor :val, :next
#   def initialize(val)
#     @val = val
#     @next = nil
#   end
# end

# @param {ListNode} headA
# @param {ListNode} headB
# @return {ListNode}
def getIntersectionNode(headA, headB)
  return nil if headA.nil? || headB.nil?
  node_a = headA
  node_b = headB

  while(node_a != node_b)
    if node_a.nil?
      node_a = headB
    else
      node_a = node_a.next
    end

    if node_b.nil?
      node_b = headA
    else
      node_b = node_b.next
    end
  end

  node_a
end

listA = [4,1,8,4,5]
listB = [5,6,1,8,4,5]
getIntersectionNode(listA, listB)
# Output: Reference of the node with value = 8

# Input Explanation: The intersected node's value is 8
# (note that this must not be 0 if the two lists intersect).
# From the head of A, it reads as [4,1,8,4,5]. From the head of B,
# it reads as [5,6,1,8,4,5]. There are 2 nodes before the intersected node
# in A; There are 3 nodes before the intersected node in B.

listA = [1,9,1,2,4]
listB = [3,2,4]
getIntersectionNode(listA, listB)
# Output: Reference of the node with value = 2

# Input Explanation: The intersected node's value is 2
# (note that this must not be 0 if the two lists intersect).
# From the head of A, it reads as [1,9,1,2,4]. From the head of B,
# it reads as [3,2,4]. There are 3 nodes before the intersected node in A;
# There are 1 node before the intersected node in B.


listA = [2,6,4]
listB = [1,5]
getIntersectionNode(listA, listB)
# => null

# Input Explanation: From the head of A, it reads as [2,6,4].
# From the head of B, it reads as [1,5]. Since the two lists do not intersect,
# intersectVal must be 0, while skipA and skipB can be arbitrary values.
# Explanation: The two lists do not intersect, so return null.
