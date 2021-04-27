# You are given the head of a singly linked-list. The list can be represented as:
#
# L0 → L1 → … → Ln - 1 → Ln
# Reorder the list to be on the following form:
#
# L0 → Ln → L1 → Ln - 1 → L2 → Ln - 2 → …
# You may not modify the values in the list's nodes. Only nodes themselves may be changed.
#
# Example 1:
#
# Input: head = [1,2,3,4]
# Output: [1,4,2,3]
#
# Example 2:
#
# Input: head = [1,2,3,4,5]
# Output: [1,5,2,4,3]

# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} head
# @return {Void} Do not return anything, modify head in-place instead.
def reorder_list(head)
    if not head
        return
    end

    # find the middle of linked list [Problem 876]
    # in 1->2->3->4->5->6 find 4
    slow = fast = head
    while fast && fast.next
        slow = slow.next
        fast = fast.next.next
    end

    # reverse the second part of the list [Problem 206]
    # convert 1->2->3->4->5->6 into 1->2->3->4 and 6->5->4
    # reverse the second half in-place
    prev, curr = nil, slow
    while curr
        curr.next, prev, curr = prev, curr, curr.next
    end

    # merge two sorted linked lists [Problem 21]
    # merge 1->2->3->4 and 6->5->4 into 1->6->2->5->3->4
    first, second = head, prev
    while second.next
        first.next, first = second, first.next
        second.next, second = first, second.next
    end
end
