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

#
# Approach 2: Iterative
#

# Yeah, technically you can get away with just one stack for both indices, or even one stack for the indices and the current node since you already know what order you need to pop off each so you can just add the indices and nodes in the order that you need to correctly pop them off, but it looks super weird and unreadable IMHO.

# Complexity Analysis
#
# Time complexity: O(N) since we visit each node exactly once.
# Space complexity: O(N). O(N) to keep the output, and O(logN) for the recursion stack.

def sorted_array_to_bst(nums)
  left_indices = [0]
  right_indices = [nums.length-1]
  root = TreeNode.new(nil)
  nodes = [root]

  while nodes.any?
    node = nodes.pop
    left = left_indices.pop
    right = right_indices.pop
    mid = left + (right - left)/2

    node.val = nums[mid]

    if left < mid
      node.left = TreeNode.new(nil)
      nodes << node.left
      left_indices << left
      right_indices << mid - 1
    end

    if right > mid
      node.right = TreeNode.new(nil)
      nodes << node.right
      left_indices << mid + 1
      right_indices << right
    end
  end

  root
end
