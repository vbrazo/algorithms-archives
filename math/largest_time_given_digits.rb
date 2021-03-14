# Largest Time for Given Digits

# Given an array arr of 4 digits, find the latest 24-hour time that can be made using each digit exactly once.

# 24-hour times are formatted as "HH:MM", where HH is between 00 and 23, and MM is between 00 and 59. The earliest 24-hour time is 00:00, and the latest is 23:59.

# Return the latest 24-hour time in "HH:MM" format.  If no valid time can be made, return an empty string.

# Example 1:
#
# Input: A = [1,2,3,4]
# Output: "23:41"
# Explanation: The valid 24-hour times are "12:34", "12:43", "13:24", "13:42", "14:23", "14:32", "21:34", "21:43", "23:14", and "23:41". Of these times, "23:41" is the latest.
#
# Example 2:
#
# Input: A = [5,5,5,5]
# Output: ""
# Explanation: There are no valid 24-hour times as "55:55" is not valid.
#
# Example 3:
#
# Input: A = [0,0,0,0]
# Output: "00:00"
#
# Example 4:
#
# Input: A = [0,0,1,0]
# Output: "10:00"

#
# Approach 1: Enumerate the Permutations
#

# @param {Integer[]} arr
# @return {String}
# @param {Integer[]} a
# @return {String}
def largest_time_from_digits(a)
  a = a.permutation.map { |b| '%d%d:%d%d' % b }
  a = a.select { |t| valid?(t) }
  a.max || ''
end

def valid?(str)
  str.match?(/^([01]?[0-9]|2[0-3]):[0-5][0-9]$/)
end

# HH:MM
# HH <= 24
# MM <= 60

arr = [1,2,3,4]
largest_time_from_digits(arr)
# Output: "23:41"

arr = [5,5,5,5]
largest_time_from_digits(arr)
# Output: ""

arr = [0,0,0,0]
largest_time_from_digits(arr)
# Output: "00:00"

arr = [0,0,1,0]
largest_time_from_digits(arr)
# Output: "10:00"
