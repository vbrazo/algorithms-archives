# Challenge name: Integer to English Words

# Convert a non-negative integer num to its English words representation.

# Example 1:
#
# Input: num = 123
# Output: "One Hundred Twenty Three"

# Example 2:
#
# Input: num = 12345
# Output: "Twelve Thousand Three Hundred Forty Five"

# Example 3:
#
# Input: num = 1234567
# Output: "One Million Two Hundred Thirty Four Thousand Five Hundred Sixty Seven"

# Example 4:
#
# Input: num = 1234567891
# Output: "One Billion Two Hundred Thirty Four Million Five Hundred Sixty Seven Thousand Eight Hundred Ninety One"

#
# Approach 1: Divide and conquer
#

# Complexity Analysis
#
# Time complexity: O(N). Intuitively the output is proportional to the number N of digits in the input.
# Space complexity: O(1) since the output is just a string.

LESS_THAN_20 = [
  "",
  "One",
  "Two",
  "Three",
  "Four",
  "Five",
  "Six",
  "Seven",
  "Eight",
  "Nine",
  "Ten",
  "Eleven",
  "Twelve",
  "Thirteen",
  "Fourteen",
  "Fifteen",
  "Sixteen",
  "Seventeen",
  "Eighteen",
  "Nineteen"
]

TENS = [
  "",
  "Ten",
  "Twenty",
  "Thirty",
  "Forty",
  "Fifty",
  "Sixty",
  "Seventy",
  "Eighty",
  "Ninety"
]

THOUSANDS = [
  "",
  "Thousand",
  "Million",
  "Billion"
]

def number_to_words(num)
  return "Zero" if num == 0

  words = ""
  i = 0

  while num > 0
    words = helper(num % 1000) + THOUSANDS[i] + " " + words if num % 1000 != 0

    num /= 1000
    i += 1
  end

  words.strip!
end

def helper(num)
  return "" if num == 0

  if num < 20
    LESS_THAN_20[num] + " "
  elsif num < 100
    TENS[num / 10] + " " + helper(num % 10)
  else
    LESS_THAN_20[num / 100] + " Hundred " + helper(num % 100)
  end
end

num = 123
print number_to_words(num)
# Output: "One Hundred Twenty Three"

num = 12_345
print number_to_words(num)
# Output: "Twelve Thousand Three Hundred Forty Five"

num = 1_234_567
print number_to_words(num)
# Output: "One Million Two Hundred Thirty Four Thousand Five Hundred Sixty Seven"

num = 1_234_567_891
print number_to_words(num)
# Output: "One Billion Two Hundred Thirty Four Million Five Hundred Sixty Seven Thousand Eight Hundred Ninety One"
