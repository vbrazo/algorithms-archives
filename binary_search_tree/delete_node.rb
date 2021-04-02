# Given a root node reference of a BST and a key, delete the node with the given
# key in the BST. Return the root node reference (possibly updated) of the BST.
#
# Basically, the deletion can be divided into two stages:
#
# Search for a node to remove. If the node is found, delete the node.
#
# Follow up: Can you solve it with time complexity O(height of tree)?

#
# Approach: Recursive
#

def delete_node(node, key)
  return if node.nil?

  if key < node.val
    node.left = delete_node(node.left, key)
  elsif key > node.val
    node.right = delete_node(node.right, key)
  elsif node.left.nil? && node.right.nil?
    node = nil
  elsif node.right
    node.val = successor(node)
    node.right = delete_node(node.right, node.val)
  else
    node.val = predecessor(node)
    node.left = delete_node(node.left, node.val)
  end

  node
end

private

def successor(node)
  node = node.right

  node = node.left until node.left.nil?

  node.val
end

def predecessor(node)
  node = node.left

  node = node.right until node.right.nil?

  node.val
end
