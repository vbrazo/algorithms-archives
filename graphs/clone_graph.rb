# Given a reference of a node in a connected undirected graph.

# Return a deep copy (clone) of the graph.

# Each node in the graph contains a val (int) and a list (List[Node]) of its neighbors.

# class Node {
#     public int val;
#     public List<Node> neighbors;
# }
 

# Test case format:

# For simplicity sake, each node's value is the same as the node's index (1-indexed). For example, the first node with val = 1, the second node with val = 2, and so on. The graph is represented in the test case using an adjacency list.

# Adjacency list is a collection of unordered lists used to represent a finite graph. Each list describes the set of neighbors of a node in the graph.

# The given node will always be the first node with val = 1. You must return the copy of the given node as a reference to the cloned graph.


# Definition for a Node.
class Node
  attr_accessor :val, :neighbors
  def initialize(val = 0, neighbors = nil)
    @val = val
    neighbors = [] if neighbors.nil?
    @neighbors = neighbors
  end
end

def clone_graph(node)
  first = node&.val
  hash = {}

  b_traverse(node) do |n|
    curr = hash[n.val] || Node.new(n.val)
    cloned = curr

    n.neighbors.each do |neighbor|
      found = hash[neighbor.val] || Node.new(neighbor.val)
      curr.neighbors << found
      hash[neighbor.val] = found
    end

    hash[curr.val] = curr
  end

  hash[first]
end

# Approach: DFS

def d_traverse(node, visited: [], &block)
  return if node.nil?

  visited << node
  yield node

  node.neighbors.each do |n|
    next if visited.include? n

    d_traverse(n, visited: visited, &block)
  end
end

# Approach: BFS

def b_traverse(root, &block)
  stack = [root]
  visited = []

  until stack.empty?
    node = stack.pop
    next if node.nil? || visited.include?(node)

    visited << node
    yield node

    node.neighbors.each do |n|
      stack << n
    end
  end
end

# Example 1:

# Input: adjList = [[2,4],[1,3],[2,4],[1,3]]
# Output: [[2,4],[1,3],[2,4],[1,3]]
# Explanation: There are 4 nodes in the graph.
# 1st node (val = 1)'s neighbors are 2nd node (val = 2) and 4th node (val = 4).
# 2nd node (val = 2)'s neighbors are 1st node (val = 1) and 3rd node (val = 3).
# 3rd node (val = 3)'s neighbors are 2nd node (val = 2) and 4th node (val = 4).
# 4th node (val = 4)'s neighbors are 1st node (val = 1) and 3rd node (val = 3).

# Example 2:

# Input: adjList = [[]]
# Output: [[]]
# Explanation: Note that the input contains one empty list. The graph consists of only one node with val = 1 and it does not have any neighbors.

# Example 3:

# Input: adjList = []
# Output: []
# Explanation: This an empty graph, it does not have any nodes.

# Example 4:

# Input: adjList = [[2],[1]]
# Output: [[2],[1]]
