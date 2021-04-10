# Given two nodes of a binary tree p and q, return their lowest common ancestor (LCA).
#
# Each node will have a reference to its parent node. The definition for Node is below:
#
# class Node {
#     public int val;
#     public Node left;
#     public Node right;
#     public Node parent;
# }
# According to the definition of LCA on Wikipedia: "The lowest common ancestor of two nodes p and q in a tree T is the lowest node that has both p and q as descendants (where we allow a node to be a descendant of itself)."
#
# Example 1:
#
# Input: root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 1
# Output: 3
# Explanation: The LCA of nodes 5 and 1 is 3.
#
# Example 2:
#
# Input: root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 4
# Output: 5
# Explanation: The LCA of nodes 5 and 4 is 5 since a node can be a descendant of itself according to the LCA definition.
#
# Example 3:
#
# Input: root = [1,2], p = 1, q = 2
# Output: 1

def lowest_common_ancestor(p, q)
  visited_p = []
  visited_q = []
  # Hash{int:Node}
  nodes = {}

  node_p = p
  node_q = q

  while node_p || node_q do
	if node_p
	  visited_p << node_p.val
	  nodes[node_p.val] = node_p
	  node_p = node_p && node_p.parent
	end

	if node_q
	  visited_q << node_q.val
	  node_q = node_q && node_q.parent
	  node_q && nodes[node_q.val] = node_q
	end
  end

  # find the common nodes by getting the union
  common_nodes = visited_p & visited_q

  nodes[common_nodes.first]
end
