# Given a linked list, return the node where the cycle begins.
# If there is no cycle, return null.
# There is a cycle in a linked list if there is some node in the list
# that can be reached again by continuously following the next pointer.
# Internally, pos is used to denote the index of the node that
# tail's next pointer is connected to. Note that pos is not passed
# as a parameter.
# Notice that you should not modify the linked list.

# Intuition
#
# If we keep track of the nodes that we've seen already in a Set,
# we can traverse the list and return the first duplicate node.
#
# Algorithm
#
# First, we allocate a Set to store ListNode references.
# Then, we traverse the list, checking visited for containment
# of the current node. If the node has already been seen,
# then it is necessarily the entrance to the cycle.
# If any other node were the entrance to the cycle,
# then we would have already returned that node instead.
# Otherwise, the if condition will never be satisfied, and
# our function will return null.
#
# The algorithm necessarily terminates for any list with a finite
# number of nodes, as the domain of input lists can be divided into
# two categories: cyclic and acyclic lists. An acyclic list
# resembles a null-terminated chain of nodes, while a cyclic list
# can be thought of as an acyclic list with the final null replaced
# by a reference to some previous node. If the while loop terminates,
# we return null, as we have traversed the entire list without
# encountering a duplicate reference. In this case, the list is acyclic.
# For a cyclic list, the while loop will never terminate, but at some point
# the if condition will be satisfied and cause the function to return.

# Complexity Analysis

# Time complexity: O(n)

# For both cyclic and acyclic inputs, the algorithm must visit each node
# exactly once. This is transparently obvious for acyclic lists because
# the nnth node points to null, causing the loop to terminate. For cyclic lists,
# the if condition will cause the function to return after visiting
# the nnth node, as it points to some node that is already in visited.
# In both cases, the number of nodes visited is exactly nn, so the runtime
# is linear in the number of nodes.

# Space complexity: O(n)

# For both cyclic and acyclic inputs, we will need to insert each node
# into the Set once. The only difference between the two cases is whether
# we discover that the "last" node points to null or a previously-visited
# node. Therefore, because the Set will contain nn distinct nodes,
# the memory footprint is linear in the number of nodes.

class ListNode
  attr_accessor :val, :next

  def initialize(val)
    @val = val
    @next = nil
  end
end

def detectCycle(head)
  visited = []

  while head != nil
    if visited.include?(head)
      return head
    else
      visited.push(head)
      head = head.next
    end
  end

  return
end


# Approach 2: Floyd's Tortoise and Hare
#
# Intuition
#
# What happens when a fast runner (a hare) races a slow runner (a tortoise)
# on a circular track? At some point, the fast runner will catch up to the slow
# runner from behind.
#
# Algorithm
#
# Floyd's algorithm is separated into two distinct phases. In the first phase,
# it determines whether a cycle is present in the list. If no cycle is present,
# it returns null immediately, as it is impossible to find the entrance to a
# nonexistant cycle. Otherwise, it uses the located "intersection node" to
# find the entrance to the cycle.


# Complexity Analysis
#
# Time complexity : O(n)
#
# For cyclic lists, hare and tortoise will point to the same node
# after F+C-h iterations, as demonstrated in the proof of correctness.
# F+C−h≤F+C=n, so phase 1 runs in O(n) time.
# Phase 2 runs for F < n iterations, so it also runs in O(n) time.
#
# For acyclic lists, hare will reach the end of the list in roughly n/2
# 2n iterations, causing the function to return before phase 2. Therefore,
# regardless of which category of list the algorithm receives, it runs in time
# linearly proportional to the number of nodes.
#
# Space complexity: O(1)
#
# Floyd's Tortoise and Hare algorithm allocates only pointers, so it runs with constant overall memory usage.

def getIntersect(head)
  tortoise = head
  hare = head

  # A fast pointer will either loop around a cycle and meet the slow
  # pointer or reach the `null` at the end of a non-cyclic list.
  while hare != nil and hare.next != nil
    tortoise = tortoise.next
    hare = hare.next.next

    if tortoise == hare
      return tortoise
    end
  end

  return
end

def detectCycle(head)
  if head.nil?
    return
  end

  # If there is a cycle, the fast/slow pointers will intersect at some
  # node. Otherwise, there is no cycle, so we cannot find an entrance to
  # a cycle.
  intersect = self.getIntersect(head)
  if intersect.nil?
    return
  end

  # To find the entrance to the cycle, we have two pointers traverse at
  # the same speed -- one from the front of the list, and the other from
  # the point of intersection.
  ptr1 = head
  ptr2 = intersect
  while ptr1 != ptr2
    ptr1 = ptr1.next
    ptr2 = ptr2.next
  end

  return ptr1
end
