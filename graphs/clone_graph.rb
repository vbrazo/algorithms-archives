# Definition for a Node.
# class Node
#     attr_accessor :val, :neighbors
#     def initialize(val = 0, neighbors = nil)
#		  @val = val
#		  neighbors = [] if neighbors.nil?
#         @neighbors = neighbors
#     end
# end

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
