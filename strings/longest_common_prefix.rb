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
  return "" if strs.empty? 

  s = ""
  base = strs[0]

  for i in 0..base.length-1
    if strs.all?{|x| x[i] == base[i]}
      s += base[i]
    else
      break
    end
  end

  s
end

strs = %w[flower flow flight]
puts longest_common_prefix(strs)
# Output: "fl"

strs = %w[dog racecar car]
puts longest_common_prefix(strs)
# Output: ""
