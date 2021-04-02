# Given a string s which represents an expression, evaluate this expression and return its value.
#
# The integer division should truncate toward zero.
#
# Example 1:
#
# Input: s = "3+2*2"
# Output: 7
#
# Example 2:
#
# Input: s = " 3/2 "
# Output: 1
#
# Example 3:
#
# Input: s = " 3+5 / 2 "
# Output: 5

# @param {String} s
# @return {Integer}
def calculate(s)
  operators = Set.new(%w[+ - * /])
  digits = Set.new('0'..'9')

  num = 0
  presign = '+'
  stack = []

  (s.delete(' ') + '+').each_char do |char|
    if digits.include?(char)
      num = num*10 + char.to_i
    elsif operators.include?(char)
      stack << case presign
        when '+' ; num
        when '-' ; -num
        when '*' ; stack.pop*num
        when '/' ; (stack.pop.to_f/num).to_i
      end

      presign = char
      num = 0
    end
  end

  stack.sum
end

s = "3+2*2"
puts calculate(s)
# Output: 7

s = " 3/2 "
puts calculate(s)
# Output: 1

s = " 3+5 / 2 "
puts calculate(s)
# Output: 5
