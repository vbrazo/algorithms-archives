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

#
# Approach 2: Iterative Inorder Traversal
#

# Alternatively, we could implement the above algorithm iteratively.

# Complexity Analysis
#
# Time complexity: O(N) in the worst case when the tree is BST or the "bad" element is a rightmost leaf
# Space complexity: O(N) to keep stack.

def is_valid_bst(root)
  result = []
  stack = []
  iterator = root

  while iterator || !stack.empty? do
    if iterator.nil?
      node = stack.pop

      if result.count > 0 && result.last >= node.val
        return false
      end

      result << node.val
      iterator = node&.right
    else
      stack << iterator
      iterator = iterator.left
    end
  end

  true
end
