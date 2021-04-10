# Given a string containing just the characters '(' and ')', find the length of the longest valid (well-formed) parentheses substring.
# 
# Example 1:
# Input: s = "(()"
# Output: 2
# Explanation: The longest valid parentheses substring is "()".
# 
# Example 2:
# Input: s = ")()())"
# Output: 4
# Explanation: The longest valid parentheses substring is "()()".
# 
# Example 3:
# Input: s = ""
# Output: 0

# O(N) time

def longest_valid_parentheses(s)
  stack = [-1]
  max_len = 0

  s.length.times do |i|
    top = stack.last

    if top != -1 && s[top] == '(' && s[i] == ')'
      stack.pop
      max_len = [max_len, i - stack.last].max
    else
      stack << i
    end
  end

  max_len
end

# O(N) time O(1) space solution

# @param {String} s
# @return {Integer}
def longest_valid_parentheses(s)
  [
    longest_valid_parens(s, false),
    longest_valid_parens(s, true)
  ].max
end


def longest_valid_parens(s, reverse)
  num_open = 0

  open_parens = '('
  closed_parens = ')'

  curr_seq = 0
  max_seq = 0

  if reverse
    s = s.reverse
    open_parens, closed_parens = closed_parens, open_parens
  end

  s.each_char do |parens|
    complete = false

    ### Consume the current parens
    # add to curr seq if you can
    if parens == open_parens
      num_open += 1
      curr_seq += 1
    elsif parens == closed_parens && num_open == 0
      complete = true # the sequence was valid, and is now over
    elsif parens == closed_parens
      num_open -= 1
      curr_seq += 1
    end

    ### After consuming the current parens
    # update max_seq if we currently have a valid curr sequence
    if num_open == 0 # i.e. valid
      max_seq = curr_seq if curr_seq > max_seq
      curr_seq = 0 if complete
    end
  end

  max_seq
end
