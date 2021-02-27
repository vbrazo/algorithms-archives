# Given a binary tree, check whether it is a mirror of itself (ie, symmetric around its center).

# For example, this binary tree [1,2,2,3,4,4,3] is symmetric:

#      1
#    /   \
#   2     2
#  / \   / \
# 3   4 4   3

# But the following [1,2,2,null,3,null,3] is not:

#    1
#   / \
#  2   2
#   \   \
#    3   3

#
# Approach 1: Recursive
#

# A tree is symmetric if the left subtree is a mirror reflection of the right subtree.
# Therefore, the question is: when are two trees a mirror reflection of each other?
# Two trees are a mirror reflection of each other if:
# Their two roots have the same value.
# The right subtree of each tree is a mirror reflection of the left subtree of
# the other tree.

# This is like a person looking at a mirror.
# The reflection in the mirror has the same head, but the reflection's right arm
# corresponds to the actual person's left arm, and vice versa.

# The explanation above translates naturally to a recursive function as follows.

# Complexity Analysis

# Time complexity: O(n). Because we traverse the entire input tree once,
# the total run time is O(n), where nn is the total number of nodes in the tree.

# Space complexity: The number of recursive calls is bound by the height of the tree.
# In the worst case, the tree is linear and the height is in O(n). Therefore,
# space complexity due to recursive calls on the stack is O(n) in the worst case.

# Definition for a binary tree node.
class TreeNode
  attr_accessor :val, :left, :right

  def initialize(val = 0, left = nil, right = nil)
    @val = val
    @left = left
    @right = right
  end
end

# @param {TreeNode} root
# @return {Boolean}
def is_symmetric(root)
  is_mirror(root, root)
end

def is_mirror(t1, t2)
  return true if t1.nil? && t2.nil?

  (t1.val == t2.val) && is_mirror(t1.right, t2.left) && is_mirror(t1.left, t2.right)
end

#
# Approach 2: Iterative
#

# Instead of recursion, we can also use iteration with the aid of a queue.
# Each two consecutive nodes in the queue should be equal, and their subtrees
# a mirror of each other. Initially, the queue contains root and root.
# Then the algorithm works similarly to BFS, with some key differences.
# Each time, two nodes are extracted and their values compared. Then, the right
# and left children of the two nodes are inserted in the queue in opposite order.
# The algorithm is done when either the queue is empty, or we detect that the tree
# is not symmetric (i.e. we pull out two consecutive nodes from the queue that are unequal).

# Complexity Analysis

# Time complexity: O(n). Because we traverse the entire input tree once,
# the total run time is O(n), where nn is the total number of nodes in the tree.
# Space complexity: There is additional space required for the search queue.
# In the worst case, we have to insert O(n) nodes in the queue. Therefore,
# space complexity is O(n).

def is_symmetric(root)
  return true if root.nil?

  stack = []
  stack << root.left  if root.left
  stack << root.right if root.right

  until stack.empty?
    return false unless stack.size.even?

    right = stack.pop
    left  = stack.pop
    return false unless right.val == left.val

    return false unless left.left.nil? == right.right.nil?

    stack << left.left   if left.left
    stack << right.right if right.right

    return false unless left.right.nil? == right.left.nil?

    stack << left.right  if left.right
    stack << right.left  if right.left
  end

  true
end
