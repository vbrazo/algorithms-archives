# Intuition
#
# First, let's understand our problem.
#
# "Given a binary array, find the maximum number of consecutive 1s in this array..."
#
# Okay makes sense so far.
#
# "...if you can flip at most one 0."
#
# Huh? What does that even mean?
#
# Let's translate that into something more concrete. We can rephrase
# "if you can flip at most one 0" into "allowing at most one 0 within an
# otherwise consecutive run of 1s". These statements are equal because
# if we had one 0 in our consecutive array, we could flip it to satisfy our condition.
# Note, we're not actually going to flip the 0 which will make our approach simpler.
#
# So our new problem statement is:
#
# "Given a binary array, find the maximum number of consecutive 1s in this array,
# allowing at most one 0 within an otherwise consecutive run of 1s"

# Approach 1: Brute Force

# Algorithm
#
# Let's start simple and work our way up.
#
# A brute force solution usually involves trying to check every single possibility. It'll look something like this:
#
# Check every possible consecutive sequence
# Count how many 0's are in each sequence
# If our sequence has one or fewer 0's, check if that's the longest consecutive sequence of 1's.

# Complexity Analysis

# Let n be equal to the length of the input nums array.

# Time complexity: O(n^2). The nested for loops turn our approach into a quadratic
# solution because for every index, we have to check every other index in the array.
# Space complexity: O(1). We are using 4 variables: left, right, numZeroes, longestSequence.
# The number of variables are constant and do not change based on the size of the input.

# @param {Integer[]} nums
# @return {Integer}
def find_max_consecutive_ones(nums)
  longest_sequence = 0

  (0..nums.count-1).each do |left|
    num_zeroes = 0

    (left..nums.count-1).each do |right|
      if num_zeroes == 2
        num_zeroes += 1
      end

      if nums[right] == 0
        num_zeroes += 1
      end

      if num_zeroes <= 1
        if longest_sequence > right - left + 1
          longest_sequence = longest_sequence
        else
          longest_sequence = right - left + 1
        end
      end
    end
  end

  longest_sequence
end

# Approach 2: Sliding Window

# Intuition

# The naive approach works but our interviewer is not convinced.
# Let's see how we can optimize the code we just wrote.

# The brute force solution had a time complexity of O(n^2).
# What was the bottleneck? Checking every single consecutive sequence.
# Intuitively, we know we're doing repeated work because sequences overlap.
# We are checking consecutive sequence blindly.
# We need to establish some rules on how to move our sequence forward.

# If our sequence is valid, let's continue expanding our sequence
# (because our goal is to get the largest sequence possible).
# If our sequence is invalid, let's stop expanding and contract our sequence
# (because an invalid sequence will never count towards our largest sequence).
# The pattern that comes to mind for expanding/contracting sequences is
# the sliding window. Let's define valid and invalid states.

# Valid State = one or fewer 0's in our current sequence
# Invalid State = two 0's in our current sequence

# Complexity Analysis
#
# Let nn be equal to the length of the input nums array.
#
# Time complexity: O(n). Since both the pointers only move forward,
# each of the left and right pointer traverse a maximum of n steps.
# Therefore, the timecomplexity is O(n)O.
#
# Space complexity: O(1). Same as the previous approach. We don't store anything
# other than variables. Thus, the space we use is constant because it is not
# correlated to the length of the input array.

# @param {Integer[]} nums
# @return {Integer}
def find_max_consecutive_ones(nums)
  longest_sequence = 0
  left, right = 0, 0
  num_zeroes = 0

  # while our window is in bounds
  while right < nums.count
    # add the right most element into our window
    num_zeroes += 1 if nums[right] == 0

    # if our window is invalid, contract our window
    while num_zeroes == 2
      num_zeroes -= 1 if nums[left] == 0

      left += 1
    end

    # update our longest sequence answer
    if longest_sequence > right - left + 1
      longest_sequence = longest_sequence
    else
      longest_sequence = right - left + 1
    end
    right += 1   # expand our window
  end

  longest_sequence
end
