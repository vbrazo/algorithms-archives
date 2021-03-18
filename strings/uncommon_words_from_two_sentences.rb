# We are given two sentences A and B.
# (A sentence is a string of space separated words.
# Each word consists only of lowercase letters.)
#
# A word is uncommon if it appears exactly once in one of the sentences,
# and does not appear in the other sentence.
#
# Return a list of all uncommon words.
#
# You may return the list in any order.

# Example 1:
#
# Input: A = "this apple is sweet", B = "this apple is sour"
# Output: ["sweet","sour"]
#
# Example 2:
#
# Input: A = "apple apple", B = "banana"
# Output: ["banana"]

# @param {String} a
# @param {String} b
# @return {String[]}
def uncommon_from_sentences(a, b)
  hash = Hash.new(0)

  a.split(" ").each{ |ele| hash[ele] += 1 }
  b.split(" ").each{ |ele| hash[ele] += 1 }

  hash.select{ |k,v| v == 1 }.keys
end

a = "this apple is sweet"
b = "this apple is sour"
print uncommon_from_sentences(a, b)
# Output: ["sweet","sour"]

a = "apple apple"
b = "banana"
print uncommon_from_sentences(a, b)
# Output: ["banana"]
