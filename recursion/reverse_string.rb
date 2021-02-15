# Write a function that reverses a string. The input string is given
# as an array of characters char[].

# Do not allocate extra space for another array, you must do this by modifying
# the input array in-place with O(1) extra memory.

# You may assume all the characters consist of printable ascii characters.

# Approach 1: Recursion, In-Place, O(N) Space
# Does in-place mean constant space complexity?
#
# No. By definition, an in-place algorithm is an algorithm which transforms
# input using no auxiliary data structure.
#
# The tricky part is that space is used by many actors, not only by
# data structures. The classical example is to use recursive function without
# any auxiliary data structures.
#
# Is it in-place? Yes.
#
# Is it constant space? No, because of recursion stack.

# Complexity Analysis

# Time complexity: O(N) time to perform N/2 swaps.
# Space complexity: O(N) to keep the recursion stack.

# @param {Character[]} s
# @return {Void} Do not return anything, modify s in-place instead.
def reverse_string(s)
  helper(s, 0, s.count - 1)

  print("#{s}\n")
end

def helper(s, left, right)
  if left < right
    s[left], s[right] = s[right], s[left]

    helper(s, left + 1, right - 1)
  end
end

print(reverse_string(["h","e","l","l","o"]))
# Output: ["o","l","l","e","h"]

reverse_string(["H","a","n","n","a","h"])
# Output: ["h","a","n","n","a","H"]
