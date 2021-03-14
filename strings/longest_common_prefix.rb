# Write a function to find the longest common prefix string amongst an array of strings.
#
# If there is no common prefix, return an empty string "".
#
#
# Example 1:
#
# Input: strs = ["flower","flow","flight"]
# Output: "fl"
#
# Example 2:
#
# Input: strs = ["dog","racecar","car"]
# Output: ""
# Explanation: There is no common prefix among the input strings.

#
# Approach 1: Horizontal scanning
#

# @param {String[]} strs
# @return {String}
def longest_common_prefix(strs)
  strs.each do |word|
    
  end
end

strs = %w[flower flow flight]
puts longest_common_prefix(strs)
# Output: "fl"

strs = %w[dog racecar car]
puts longest_common_prefix(strs)
# Output: ""
