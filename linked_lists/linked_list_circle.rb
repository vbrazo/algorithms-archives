# Given head, the head of a linked list, determine if the linked list has a cycle in it.

# There is a cycle in a linked list if there is some node in the list that can be
# reached again by continuously following the next pointer. Internally, pos is used to
# denote the index of the node that tail's next pointer is connected to.
# Note that pos is not passed as a parameter.

# Return true if there is a cycle in the linked list. Otherwise, return false

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
  slower, faster = head, head

  while !slower.nil? && !faster.nil? && !faster.next.nil?
    slower = slower.next
    faster = faster.next.next

    return true if slower == faster
  end

  return false
end

head = [3,2,0,-4]
pos = 1
has_cycle(head)
# => true
# Explanation: There is a cycle in the linked list,
# where the tail connects to the 1st node (0-indexed).

head = [1,2]
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
