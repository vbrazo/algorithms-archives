# Find Common Characters
#
# Given an array A of strings made only from lowercase letters, return a list
# of all characters that show up in all strings within the list
# (including duplicates).  For example, if a character occurs 3 times in all
# strings but not 4 times, you need to include that character three times in
# the final answer.
#
# You may return the answer in any order.
#
# Example 1:
#
# Input: ["bella","label","roller"]
# Output: ["e","l","l"]
#
# Example 2:
#
# Input: ["cool","lock","cook"]
# Output: ["c","o"]

# @param {String[]} a
# @return {String[]}
def common_chars(a)
  hash = Hash.new(0)
  a[0].each_char {|char| hash[char] += 1}

  (1...a.length).each do |i|
    hash.keys.each do |char|
      if hash[char] > a[i].count(char)
        hash[char] = a[i].count(char)
      end
    end
  end

  result = []

  hash.each do |char, count|
    count.times do
      result << char
    end
  end

  result
end

words = ["bella","label","roller"]
puts common_chars(words)
# Output: ["e","l","l"]

words = ["cool","lock","cook"]
puts common_chars(words)
# Output: ["c","o"]
