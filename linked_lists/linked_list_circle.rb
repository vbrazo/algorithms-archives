# Given head, the head of a linked list, determine if the linked list has a cycle in it.

# There is a cycle in a linked list if there is some node in the list that can be
# reached again by continuously following the next pointer. Internally, pos is used to
# denote the index of the node that tail's next pointer is connected to.
# Note that pos is not passed as a parameter.

# Return true if there is a cycle in the linked list. Otherwise, return false

#
# Approach 1: Hash Table
#

# Intuition
#
# To detect if a list is cyclic, we can check whether a node had been visited before.
# A natural way is to use a hash table.
#
# Algorithm
#
# We go through each node one by one and record each node's reference (or memory address)
# in a hash table. If the current node is null, we have reached the end of the list and
# it must not be cyclic. If current node’s reference is in the hash table, then return true.

# Complexity analysis
#
# Let nn be the total number of nodes in the linked list.
#
# Time complexity: O(n). We visit each of the nn elements in the list at most once.
# Adding a node to the hash table costs only O(1) time.
#
# Space complexity: O(n). The space depends on the number of elements added
# to the hash table, which contains at most nn elements.
class ListNode
  attr_accessor :val, :next

  def initialize(val)
    @val = val
    @next = nil
  end
end

# @param {ListNode} head
# @return {Boolean}
def has_cycle(head)
  nodes_seen = []

  until head.nil?
    return true if nodes_seen.include? head

    nodes_seen.push(head)
    head = head.next
  end

  false
end

head = [3, 2, 0, -4]
pos = 1
has_cycle(head)
# => true
# Explanation: There is a cycle in the linked list,
# where the tail connects to the 1st node (0-indexed).

head = [1, 2]
pos = 0
has_cycle(head)
# => true
# Explanation: There is a cycle in the linked list,
# where the tail connects to the 0th node.

head = [1]
pos = -1
has_cycle(head)
# => false
# Explanation: There is no cycle in the linked list.

#
# Approach 2: Floyd's Cycle Finding Algorithm
#

# Intuition
#
# Imagine two runners running on a track at different speed.
# What happens when the track is actually a circle?
#
# Algorithm
#
# The space complexity can be reduced to O(1) by considering two pointers at
# different speed - a slow pointer and a fast pointer. The slow pointer moves
# one step at a time while the fast pointer moves two steps at a time.
#
# If there is no cycle in the list, the fast pointer will eventually reach the end
# and we can return false in this case.
#
# Now consider a cyclic list and imagine the slow and fast pointers are two runners
# racing around a circle track. The fast runner will eventually meet the slow runner.
# Why? Consider this case (we name it case A) - The fast runner is just one step
# behind the slow runner. In the next iteration, they both increment one and two steps
# respectively and meet each other.
#
# How about other cases? For example, we have not considered cases where the fast runner
# is two or three steps behind the slow runner yet. This is simple, because in the next
# or next's next iteration, this case will be reduced to case A mentioned above.

# Complexity analysis
#
# Time complexity: O(n). Let us denote nn as the total number of nodes in the linked list.
# To analyze its time complexity, we consider the following two cases separately.
#
# List has no cycle:
# The fast pointer reaches the end first and the run time depends on the
# list's length, which is O(n).
#
# List has a cycle:
# We break down the movement of the slow pointer into two steps, the non-cyclic part
# and the cyclic part:
#
# The worst case time complexity is O(N+K), which is O(n).
#
# Space complexity: O(1). We only use two nodes (slow and fast) so the space complexity is O(1).

class ListNode
  attr_accessor :val, :next

  def initialize(val)
    @val = val
    @next = nil
  end
end

# @param {ListNode} head
# @return {Boolean}
def has_cycle(head)
  slower = head
  faster = head

  while !slower.nil? && !faster.nil? && !faster.next.nil?
    slower = slower.next
    faster = faster.next.next

    return true if slower == faster
  end

  false
end

head = [3, 2, 0, -4]
pos = 1
has_cycle(head)
# => true
# Explanation: There is a cycle in the linked list,
# where the tail connects to the 1st node (0-indexed).

head = [1, 2]
pos = 0
has_cycle(head)
# => true
# Explanation: There is a cycle in the linked list,
# where the tail connects to the 0th node.

head = [1]
pos = -1
has_cycle(head)
# => false
# Explanation: There is no cycle in the linked list.
