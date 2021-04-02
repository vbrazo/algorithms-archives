# Given the root of a binary tree, return the number of uni-value subtrees.
# A uni-value subtree means all nodes of the subtree have the same value.
#
# Example 1:
# Input: root = [5,1,5,5,5,null,5]
# Output: 4
#
# Example 2:
# Input: root = []
# Output: 0
#
# Example 3:
# Input: root = [5,5,5,5,5,null,5]
# Output: 6

#
# Approach 1: Recursive (Brute Force)
#

# Recursively, we could simply do a check at every node to see if it and all it's
# children as the same value. This would be extremely inefficient though with a
# time complexity of O(n^2). It does look nice and pretty though.
#
# We'll start with two helper methods that we'll also use for the iterative BFS approach.

def sames(node)
  left = node.left ? node.val == node.left.val : true
  right = node.right ? node.val == node.right.val : true

  left && right
end

def unival(root)
  return true unless root
  return false unless sames(root)

  unival(root.left) && unival(root.right)
end

# "Sames" will simply tell us if a parent node and it's children are all the
# same value. "Unival" will then take that method and iterate it down the whole
# tree and return a false if at any point "sames" returns false.
#
# Now for the actual recursive solution

def count_unival_subtrees(root)
  return 0 unless root

  count = 0
  count += 1 if unival(root)
  count + count_unival_subtrees(root.left) + count_unival_subtrees(root.right)
end

# We go to every node and add 1 to our cumulative count that node is unival with
# all of its children.
#
