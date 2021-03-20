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
