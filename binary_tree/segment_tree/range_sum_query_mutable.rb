# Given an array nums and two types of queries where you should update the value of an index in the array, and retrieve the sum of a range in the array.
#
# Implement the NumArray class:
#
# NumArray(int[] nums) initializes the object with the integer array nums.
# void update(int index, int val) updates the value of nums[index] to be val.
# int sumRange(int left, int right) returns the sum of the subarray nums[left, right] (i.e., nums[left] + nums[left + 1], ..., nums[right]).
#
#
# Example 1:
#
# Input
# ["NumArray", "sumRange", "update", "sumRange"]
# [[[1, 3, 5]], [0, 2], [1, 2], [0, 2]]
# Output
# [null, 9, null, 8]
#
# Explanation
# NumArray numArray = new NumArray([1, 3, 5]);
# numArray.sumRange(0, 2); // return 9 = sum([1,3,5])
# numArray.update(1, 2);   // nums = [1,2,5]
# numArray.sumRange(0, 2); // return 8 = sum([1,2,5])
#
#
# Constraints:
#
# 1 <= nums.length <= 3 * 104
# -100 <= nums[i] <= 100
# 0 <= index < nums.length
# -100 <= val <= 100
# 0 <= left <= right < nums.length
# At most 3 * 104 calls will be made to update and sumRange.

#
# Approach: ruby segment-tree (log(n) sum and update)
#

class NumArray
  attr_accessor :nodes, :tree

  def initialize(nums)
    @nodes = nums
    @tree = build_segment_tree(nums)
  end

  def update(idx, value)
    nodes[idx] = value
    inner_update(tree, idx, value, 0, [0, nodes.length - 1])
  end

  def sum_range(l, r)
    inner_query_sum(tree, 0, [0, nodes.length - 1], [l, r])
  end

  private

  def inner_query_sum(segment_tree, index, range, q_range)
    if range.last < q_range.first || q_range.first > q_range.last || q_range.last < range.first
      0
    elsif q_range.first == range.first && q_range.last == range.last
      segment_tree[index]
    else
      r = 0
      mid = (range.first + range.last) / 2
      if range.first <= q_range.first && mid >= q_range.first
        r += inner_query_sum(segment_tree, left(index), [range.first, mid], [q_range.first, [q_range.last, mid].min])
      end
      if mid + 1 <= q_range.last && range.last >= q_range.last
        r += inner_query_sum(segment_tree, right(index), [mid + 1, range.last],
                             [[mid + 1, q_range.first].max, q_range.last])
      end
      r
    end
  end

  def inner_update(segment_tree, idx, value, index, range)
    if range.first == range.last
      segment_tree[index] = nodes[idx]
    else
      mid = (range.first + range.last) / 2
      if range.first <= idx && idx <= mid
        inner_update(segment_tree, idx, value, left(index), [range.first, mid])
      else
        inner_update(segment_tree, idx, value, right(index), [mid + 1, range.last])
      end
      segment_tree[index] = segment_tree[left(index)].to_i + segment_tree[right(index)].to_i
    end
  end

  def build_segment_tree(nodes)
    return [] if nodes.length == 0

    height = find_tree_height(nodes.length, 10)
    segment_tree = Array.new((1 << height) - 1)
    inner_build_segment_tree(segment_tree, nodes, 0, [0, nodes.length - 1])
    segment_tree
  end

  def inner_build_segment_tree(segment_tree, nodes, index, range)
    if range.first == range.last
      segment_tree[index] = nodes[range.first]
    else
      mid = (range.first + range.last) / 2
      inner_build_segment_tree(segment_tree, nodes, left(index), [range.first, mid])
      inner_build_segment_tree(segment_tree, nodes, right(index), [mid + 1, range.last])
      segment_tree[index] = segment_tree[left(index)] + segment_tree[right(index)]
    end
  end

  def left(index)
    2 * index + 1
  end

  def right(index)
    2 * index + 2
  end

  # A tricky way (reference: SICP)
  def find_tree_height(target, guess)
    return 0 if target == 0

    high_bounder = (1 << guess) - 1
    low_bounder = (1 << (guess - 1)) - 1
    if high_bounder >= target && low_bounder < target
      guess
    elsif low_bounder >= target
      find_tree_height(target, guess - 1)
    else
      find_tree_height(target, guess + 1)
    end
  end
end
