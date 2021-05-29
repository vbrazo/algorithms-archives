# Definition for a binary tree node.
class TreeNode
  attr_accessor :val, :left, :right

  def initialize(val = 0, left = nil, right = nil)
    @val = val
    @left = left
    @right = right
  end
end

#
# Approach 1: Recursive Inorder Traversal
#

# Complexity Analysis
#
# Time complexity: O(N) in the worst case when the tree is a BST or the "bad" element is a rightmost leaf.
# Space complexity: O(N) for the space on the run-time stack.

# @param {TreeNode} root
# @return {Boolean}
def is_valid_bst(root)
  prev = nil

  in_order(root) do |val|
    return false if !prev.nil? && val <= prev
    prev = val
  end

  true
end

def in_order(node, &block)
  return if node.nil?
  in_order(node.left, &block)
  yield node.val
  in_order(node.right, &block)
end
