# Implement strStr().

# Return the index of the first occurrence of needle in haystack, or -1
# if needle is not part of haystack.

# Overview
# The problem is to find needle of length L in the haystack of length N.
#
# Let's discuss three different ideas how to proceed. They are all based on
# sliding window idea. The key point is how to implement a window slice.
#
# Linear time window slice O(L) is quite easy, move the window of length L =
# along the haystack and compare substring in the window with the needle.
# Overall that would result in O((N−L)L) time complexity.
#
# Could that be improved? Yes. Two pointers approach is still the case of
# linear time slice, though the comparison happens not for all substrings,
# and that improves the best time complexity up to O(N).
# The worst time complexity is still O((N−L)L) though.
#
# Could that be improved to O(N)?
# Yes, but one has to implement constant time slice O(1).
# There are two ways to do it:
#
# - Rabin-Karp = constant-time slice using rolling hash algorithm.
# - Bit manipulation = constant-time slice using bitmasks.


# Approach 1: Substring: Linear Time Slice
# Quite straightforward approach - move sliding window along the string and
# compare substring in the window with the needle.

# Complexity Analysis

# Time complexity: O((N−L)L), where N is a length of haystack and L is a
# length of needle. We compute a substring of length L in a loop, which is
# executed (N - L) times.

# Space complexity: O(1).

# @param {String} haystack
# @param {String} needle
# @return {Integer}
def str_str(haystack, needle)
  l = needle.length
  n = haystack.length

  (n - l + 1).times do |i|
    return i if haystack[i, l] == needle
  end

  -1
end

puts(str_str("hello","ll"))
# => 2

puts(str_str("heawello","ll"))
# => 5

puts(str_str("heawello","ll23"))
# => -1
