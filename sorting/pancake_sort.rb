# Given an array of integers arr, sort the array by performing a series of pancake flips.
#
# In one pancake flip we do the following steps:
#
# Choose an integer k where 1 <= k <= arr.length.
# Reverse the sub-array arr[0...k-1] (0-indexed).
# For example, if arr = [3,2,1,4] and we performed a pancake flip choosing k = 3, we reverse the sub-array [3,2,1], so arr = [1,2,3,4] after the pancake flip at k = 3.
#
# Return an array of the k-values corresponding to a sequence of pancake flips that sort arr. Any valid answer that sorts the array within 10 * arr.length flips will be judged as correct.
#
# Example 1:
#
# Input: arr = [3,2,4,1]
# Output: [4,2,4,3]
# Explanation:
# We perform 4 pancake flips, with k values 4, 2, 4, and 3.
# Starting state: arr = [3, 2, 4, 1]
# After 1st flip (k = 4): arr = [1, 4, 2, 3]
# After 2nd flip (k = 2): arr = [4, 1, 2, 3]
# After 3rd flip (k = 4): arr = [3, 2, 1, 4]
# After 4th flip (k = 3): arr = [1, 2, 3, 4], which is sorted.
#
# Example 2:
#
# Input: arr = [1,2,3]
# Output: []
# Explanation: The input is already sorted, so there is no need to flip anything.
# Note that other answers, such as [3, 3], would also be accepted.
#
# Constraints:
#
# 1 <= arr.length <= 100
# 1 <= arr[i] <= arr.length
# All integers in arr are unique (i.e. arr is a permutation of the integers from 1 to arr.length).

#
# Approach 1: Sort like Bubble-Sort
#

# Complexity Analysis
#
# Let N be the length of the input list.
#
# Time Complexity: O(n^2)
#
# In the algorithm, we run a loop with N iterations.
# Within each iteration, we are dealing with the corresponding prefix of the list.
# Here we denote the length of the prefix as k, e.g. in the first iteration, the
# length of the prefix is N. While in the second iteration, the length of the prefix is N-1.
# Within each iteration, we have operations whose time complexity is linear to
# the length of the prefix, such as iterating through the prefix to find the index,
# or flipping the entire prefix etc. Hence, for each iteration, its time complexity
# would be O(k). To sum up all iterations, we have the overall time complexity of the
# algorithm as ∑O(k)=O(N^2).
#
# Space Complexity: O(N)
#
# Within the algorithm, we use a list to maintain the final results,
# which is proportional to the number of pancake flips.
# For each round of iteration, at most we would add two pancake flips.
# Therefore, the maximal number of pancake flips needed would be 2⋅N.
# As a result, the space complexity of the algorithm is O(N). If one does not
# take into account the space required to hold the result of the function, then
# one could consider the above algorithm as a constant space solution.

def pancake_sort(a)
  result = []
  value_to_sort = a.count

  while value_to_sort > 0
    # locate the position for the value to sort in this round
    index = a.index(value_to_sort)

    # sink the value_to_sort to the bottom,
    #   with at most two steps of pancake flipping.
    if index != value_to_sort - 1
      # flip the value to the head if necessary
      if index != 0
        result.push(index + 1)
        swap(a, index + 1)
      end

      # now that the value is at the head, flip it to the bottom
      result.push(value_to_sort)
      swap(a, value_to_sort)
    end

    # move on to the next round
    value_to_sort -= 1
  end

  result
end

def swap(sublist, k)
  i = 0

  while i < k / 2
    sublist[i], sublist[k - i - 1] = sublist[k - i - 1], sublist[i]
    i += 1
  end
end

arr = [3, 2, 4, 1]
print pancake_sort(arr)
# Output: [4,2,4,3]
# Explanation:
# We perform 4 pancake flips, with k values 4, 2, 4, and 3.
# Starting state: arr = [3, 2, 4, 1]
# After 1st flip (k = 4): arr = [1, 4, 2, 3]
# After 2nd flip (k = 2): arr = [4, 1, 2, 3]
# After 3rd flip (k = 4): arr = [3, 2, 1, 4]
# After 4th flip (k = 3): arr = [1, 2, 3, 4], which is sorted.

arr = [1, 2, 3]
print pancake_sort(arr)
# Output: []
# Explanation: The input is already sorted, so there is no need to flip anything.
# Note that other answers, such as [3, 3], would also be accepted.
