# Given a string num which represents an integer, return true if num is a strobogrammatic number.
#
# A strobogrammatic number is a number that looks the same when rotated 180 degrees (looked at upside down).
#
# Example 1:
#
# Input: num = "69"
# Output: true
#
# Example 2:
#
# Input: num = "88"
# Output: true
#
# Example 3:
#
# Input: num = "962"
# Output: false
#
# Example 4:
#
# Input: num = "1"
# Output: true
#
#
# Constraints:
#
# 1 <= num.length <= 50
# num consists of only digits.
# num does not contain any leading zeros except for zero itself.

# 
# Approach 1: Recursion
# 

# @param {String} num
# @return {Boolean}
def is_strobogrammatic(num)
  return true if num.length == 0
  a, b = num[0], num[-1]
  sets = [['8','8'],['6','9'],['0','0'],['1','1']]
  sets.each do |set|
    if (a == set[0] && b == set[1]) || (a == set[1] && b == set[0])
      return is_strobogrammatic(num[1..-2])
    end
  end
  return false
end

num = "69"
puts is_strobogrammatic(num)
# Output: true

num = "88"
puts is_strobogrammatic(num)
# Output: true

num = "962"
puts is_strobogrammatic(num)
# Output: false

num = "1"
puts is_strobogrammatic(num)
# Output: true

# 
# Approach 2: Iterative approach
# 

def is_strobogrammatic(num)
  strobogrammatic_numbers = { 
                              '0' => '0',
                              '1' => '1',
                              '6' => '9',
                              '8' => '8',
                              '9' => '6'
                            }  

  strob_letters = []
    
  num.chars.each do |char|
    return false unless strobogrammatic_numbers.has_key?(char)  
    strob_letters.unshift(strobogrammatic_numbers[char]) if strobogrammatic_numbers.has_key?(char) 
  end
    
  num == strob_letters.join('') ? true : false
end

num = "69"
puts is_strobogrammatic(num)
# Output: true

num = "88"
puts is_strobogrammatic(num)
# Output: true

num = "962"
puts is_strobogrammatic(num)
# Output: false

num = "1"
puts is_strobogrammatic(num)
# Output: true
