#
# Given two integers representing the numerator and denominator of a fraction, return the fraction in string format.
#
# If the fractional part is repeating, enclose the repeating part in parentheses.
#
# If multiple answers are possible, return any of them.
#
# It is guaranteed that the length of the answer string is less than 104 for all the given inputs.

# Example 1:
#
# Input: numerator = 1, denominator = 2
# Output: "0.5"

# Example 2:
#
# Input: numerator = 2, denominator = 1
# Output: "2"

# Example 3:
#
# Input: numerator = 2, denominator = 3
# Output: "0.(6)"

# Example 4:
#
# Input: numerator = 4, denominator = 333
# Output: "0.(012)"

# Example 5:
#
# Input: numerator = 1, denominator = 5
# Output: "0.2"

def long_division(numerator, denominator)
  digits = []
  remainders = {}
  remainder = numerator

  while (remainder != 0)
    quotient = remainder / denominator
    digits << quotient

    remainder = remainder % denominator
    break if remainders.include?(remainder)

    remainders[remainder] = remainders.count
    remainder *= 10
  end

  if remainder != 0
    index = remainders[remainder]
    digits.insert(index + 1, '(')
    digits << ')'
  end

  digits.insert(1, '.')

  digits.join('')
end

def fraction_to_decimal(numerator, denominator)
  return numerator.to_s if denominator == 1
  return (numerator / denominator).to_s if numerator % denominator == 0

  negative = (numerator < 0 && denominator > 0) || (denominator < 0 && numerator > 0)
  numerator = numerator.abs
  denominator = denominator.abs

  str = long_division(numerator, denominator)
  str = "-#{str}" if negative
  str
end

numerator = 1
denominator = 2
puts fraction_to_decimal(numerator, denominator)
# Output: "0.5"

numerator = 2
denominator = 1
puts fraction_to_decimal(numerator, denominator)
# Output: "2"

numerator = 2
denominator = 3
puts fraction_to_decimal(numerator, denominator)
# Output: "0.(6)"

numerator = 4
denominator = 333
puts fraction_to_decimal(numerator, denominator)
# Output: "0.(012)"

numerator = 1
denominator = 5
puts fraction_to_decimal(numerator, denominator)
# Output: "0.2"
