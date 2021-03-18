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
  arr_a = a.split
  arr_b = b.split
  hash_a = {}
  hash_b = {}

  arr_a.each do |e|
    if hash_a[e].nil?
      hash_a[e] = 1
    else
      hash_a[e] += 1
    end
  end

  arr_b.each do |e|
    if hash_b[e].nil?
      hash_b[e] = 1
    else
      hash_b[e] += 1
    end
  end

  hash_a.delete_if do |key, value|
    value > 1
  end

  hash_b.delete_if do |key, value|
    value > 1
  end

  hash_a+hash_b
end

a = "this apple is sweet"
b = "this apple is sour"
print uncommon_from_sentences(a, b)
# Output: ["sweet","sour"]

a = "apple apple"
b = "banana"
print uncommon_from_sentences(a, b)
# Output: ["banana"]
