# Given the root of a binary tree, return its maximum depth.

# A binary tree's maximum depth is the number of nodes along the longest path
# from the root node down to the farthest leaf node.

# Input: root = [3,9,20,null,null,15,7]
# Output: 3

# Input: root = [1,null,2]
# Output: 2

# Input: root = []
# Output: 0

# Input: root = [0]
# Output: 1

# Definition for a binary tree node.
class TreeNode
  attr_accessor :val, :left, :right

  def initialize(val = 0, left = nil, right = nil)
    @val = val
    @left = left
    @right = right
  end
end

# Approach 1: Recursion (DFS)

# Intuition By definition, the maximum depth of a binary tree is
# the maximum number of steps to reach a leaf node from the root node.

# From the definition, an intuitive idea would be to traverse the tree and
# record the maximum depth during the traversal.

# One could traverse the tree either by Depth-First Search (DFS) strategy or
# Breadth-First Search (BFS) strategy. For this problem, either way would do.
# Here we demonstrate a solution that is implemented with the DFS strategy and recursion.

# Complexity analysis

# Time complexity: we visit each node exactly once, thus the time complexity is O(N),
# where NN is the number of nodes.

# Space complexity: in the worst case, the tree is completely unbalanced,
# e.g. each node has only left child node, the recursion call would occur N times
# (the height of the tree), therefore the storage to keep the call stack would be O(N).
# But in the best case (the tree is completely balanced), the height of the tree
# would be log(N). Therefore, the space complexity in this case would be O(log(N)).

# @param {TreeNode} root
# @return {Integer}
def max_depth(root)
  return 0 if root.nil?

  left_height = max_depth(root.left)
  right_height = max_depth(root.right)

  if left_height > right_height
    left_height + 1
  else
    right_height + 1
  end
end
