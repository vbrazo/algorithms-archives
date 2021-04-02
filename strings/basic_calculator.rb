# Given a string s representing an expression, implement a basic calculator to evaluate it.
#
# Example 1:
#
# Input: s = "1 + 1"
# Output: 2
#
# Example 2:
#
# Input: s = " 2-1 + 2 "
# Output: 3
#
# Example 3:
#
# Input: s = "(1+(4+5+2)-3)+(6+8)"
# Output: 23

def calculate(s)
  stack = []
  num = 0
  res = 0 # For the on-going result
  sign = 1 # 1 means positive, -1 means negative

  s.each_char do |char|
    if char =~ /\d/
      num = num * 10 + char.to_i
    elsif ["+", "-"].include?(char)
      res += sign * num
      num = 0
      sign = char == "+" ? 1 : -1
    elsif char == "("
      stack << res
      stack << sign
      sign = 1
      res = 0
    elsif char == ")"
      res += num * sign
      res *= stack.pop
      res += stack.pop
      num = 0
    end
  end

  res + num * sign
end

s = "1 + 1"
puts calculate(s)
# Output: 2

s = " 2-1 + 2 "
puts calculate(s)
# Output: 3

s = "(1+(4+5+2)-3)+(6+8)"
puts calculate(s)
# Output: 23
