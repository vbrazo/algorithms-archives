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

#
# Approach 2: Iterative (BFS)
#

# Now for an iterative approach. This approach is top down, and the key light bulb
# that needs to go off is that once a parent node is unival, then all of its children
# are unival. So once we hit a unival node, we can simply do a count of all the nodes
# on that tree, and be done with all of them.
#
# First let's setup a counter method that will simply return the count of all
# nodes given a root node, and then we can combine our above helper methods with
# our counter and use BFS to get the job done. Basically, as we go through our
# tree using BFS, for any root that is unival we count all the nodes from that
# root and then forget about that root node and all of its children. If however
# a node is not unival, we store its children for the next level of BFS. Worst
# case scenario, only the leaves will be unival and we'll still hit O(n^2) time complexity,
# but best case scenario we could get away with O(n) if the first root node is itself unival.

def counter(root)
  return 0 unless root

  1 + counter(root.left) + counter(root.right)
end

def count_unival_subtrees(root)
  return 0 unless root

  univals = 0
  nodes = [root]

  while nodes.any?
    next_nodes = []
    nodes.each do |node|
      if unival(node)
        univals += counter(node)
      else
        next_nodes << node.left if node.left
        next_nodes << node.right if node.right
      end
    end
    nodes = next_nodes
  end

  univals
end
