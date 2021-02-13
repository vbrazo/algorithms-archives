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
# where N is the number of nodes.

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

# Approach 2: Tail Recursion + BFS

# One might have noticed that the above recursion solution is probably not
# the most optimal one in terms of the space complexity, and in the extreme case
# the overhead of call stack might even lead to stack overflow.
# To address the issue, one can tweak the solution a bit to make it tail recursion,
# which is a specific form of recursion where the recursive call is the last action in the function.

# The benefit of having tail recursion, is that for certain programming languages (e.g. C++)
# the compiler could optimize the memory allocation of call stack by reusing the same space
# for every recursive call, rather than creating the space for each one. As a result,
# one could obtain the constant space complexity O(1) for the overhead of the recursive calls.

# Complexity analysis

# Time complexity: O(N), still we visit each node once and only once.
# As one can see, this probably is not the best example to apply the tail recursion
# technique. Because though we did gain the constant space complexity for the recursive calls,
# we pay the price of O(N) complexity to maintain the state information
# for recursive calls. This defeats the purpose of applying tail recursion.
# However, we would like to stress on the point that tail recursion is a useful form
# of recursion that could eliminate the space overhead incurred by the recursive function calls.
# Note: a function cannot be tail recursion if there are multiple occurrences of recursive calls
# in the function, even if the last action is the recursive call.
# Because the system has to maintain the function call stack for the sub-function calls
# that occur within the same function.

# TODO:

# Approach 3: Iteration
#
# Intuition
#
# We could also convert the above recursion into iteration, with the help of the stack data
# structure. Similar with the behaviors of the function call stack, the stack data structure
# follows the pattern of FILO (First-In-Last-Out), i.e. the last element that is added
# to a stack would come out first.
# With the help of the stack data structure, one could mimic the behaviors of function call
# stack that is involved in the recursion, to convert a recursive function to a function with
# iteration.
#
# Algorithm
#
# The idea is to keep the next nodes to visit in a stack. Due to the FILO behavior of stack,
# one would get the order of visit same as the one in recursion.
# We start from a stack which contains the root node and the corresponding depth which
# is 1. Then we proceed to the iterations: pop the current node out of the stack and
# push the child nodes. The depth is updated at each step.

# Complexity analysis

# Time complexity: O(N).

# Space complexity: in the worst case, the tree is completely unbalanced, e.g. each node
# has only left child node, the recursion call would occur N times (the height of the tree),
# therefore the storage to keep the call stack would be O(N). But in the
# average case (the tree is balanced), the height of the tree would be log(N).
# Therefore, the space complexity in this case would be O(log(N)).

def max_depth(root)
  node_queue = [root]
  depth = 0

  while node_queue.any?
    depth +=1
    breadth = node_queue.size
    breadth.times do
      node = node_queue.shift
      node_queue.push(node.left) unless node.left.nil?
      node_queue.push(node.right) unless node.right.nil?
    end
  end

  depth
end
