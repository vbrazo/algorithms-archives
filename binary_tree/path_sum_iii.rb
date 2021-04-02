# You are given a binary tree in which each node contains an integer value.

# Find the number of paths that sum to a given value.

# The path does not need to start or end at the root or a leaf, but it must go downwards (traveling only from parent nodes to child nodes).

# The tree has no more than 1,000 nodes and the values are in the range -1,000,000 to 1,000,000.

# Example:

# root = [10,5,-3,3,2,null,11,3,-2,null,1], sum = 8

#       10
#      /  \
#     5   -3
#    / \    \
#   3   2   11
#  / \   \
# 3  -2   1

# Return 3. The paths that sum to 8 are:

# 1.  5 -> 3
# 2.  5 -> 2 -> 1
# 3. -3 -> 11

# Complexity Analysis:
#
# Time complexity: O(n)

def path_sum(root, target)
  return 0 unless root

  path_sum_helper(root, target, 0, Hash.new(0))
end

def path_sum_helper(node, target, running_sum, paths)
  return 0 unless node

  running_sum_difference = running_sum
  running_sum += node.val
  count = paths[running_sum - target]
  count += 1 if node.val == target

  paths[running_sum_difference] += 1
  count += path_sum_helper(node.left, target, running_sum, paths)
  count += path_sum_helper(node.right, target, running_sum, paths)
  paths[running_sum_difference] -= 1

  count
end
