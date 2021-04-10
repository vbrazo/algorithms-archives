# Given a binary tree, find the lowest common ancestor (LCA) of two given nodes in the tree.
#
# According to the definition of LCA on Wikipedia: “The lowest common ancestor is defined between two nodes p and q as the lowest node in T that has both p and q as descendants (where we allow a node to be a descendant of itself).”
#
# Example 1:
#
#
# Input: root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 1
# Output: 3
# Explanation: The LCA of nodes 5 and 1 is 3.
# 
# Example 2:
#
#
# Input: root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 4
# Output: 5
# Explanation: The LCA of nodes 5 and 4 is 5, since a node can be a descendant of itself according to the LCA definition.
#
# Example 3:
#
# Input: root = [1,2], p = 1, q = 2
# Output: 1

#
# Approach 1: Recursive Approach
#

# The initial return conditions return a truthy value if there is a match and a falsey value if you have hit the bottom of the branch.
# The initial return conditions cover the case where a root is its own ancestor/descendant.

# Complexity Analysis
#
# Time Complexity: O(N)
# Space Complexity: O(N)

def lowest_common_ancestor(root, p, q)
  return root if !root || root == p || root == q
  left = lowest_common_ancestor(root.left, p,q)
  right = lowest_common_ancestor(root.right, p,q)
  return right if !left
  return left if !right
  return root
end

#
# Approach: Iterative
#

# Complexity Analysis
#
# Time Complexity: O(N)
# Space Complexity: O(N)

require 'set'
def lowest_common_ancestor(root, p, q)
  parent = Hash.new
  queue = [root]
  while !queue.empty?
    curr = queue.shift
    if curr.left
      parent[curr.left] = curr
      queue.push(curr.left)
    end
    if curr.right
      parent[curr.right] = curr
      queue.push(curr.right)
    end
  end

  ancestors = Set.new

  while p
    ancestors.add(p)
    p = parent[p]
  end

  while !ancestors.include?(q)
    q = parent[q]
  end
  q
end
