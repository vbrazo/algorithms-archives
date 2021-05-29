# Challenge name: Convert Sorted Array to Binary Search Tree
#
# Given an integer array nums where the elements are sorted in ascending order, convert it to a height-balanced binary search tree.
#
# A height-balanced binary tree is a binary tree in which the depth of the two subtrees of every node never differs by more than one.

#
# Approach 1: Recursive
#

# Complexity Analysis
#
# Time complexity: O(N) since we visit each node exactly once.
# Space complexity: O(N). O(N) to keep the output, and O(logN) for the recursion stack.

def sorted_array_to_bst(nums)
  node_index = nums.length/2

  root = TreeNode.new(nums[node_index])

  if node_index > 0
    root.left = sorted_array_to_bst(nums[0...node_index])
  end

  if node_index < nums.length - 1
    root.right = sorted_array_to_bst(nums[(node_index + 1)...nums.length])
  end

  root
end
