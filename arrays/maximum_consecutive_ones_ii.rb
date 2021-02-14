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
