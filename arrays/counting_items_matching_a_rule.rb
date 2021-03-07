# You are given an array items, where each
# items[i] = [typei, colori, namei] describes the type, color, and
# name of the ith item. You are also given a rule represented by
# two strings, ruleKey and ruleValue.
#
# The ith item is said to match the rule if one of the following
# is true:
#
# ruleKey == "type" and ruleValue == typei.
# ruleKey == "color" and ruleValue == colori.
# ruleKey == "name" and ruleValue == namei.
# Return the number of items that match the given rule.
#
#
# Example 1:
#
# Input: items = [["phone","blue","pixel"],
# ["computer","silver","lenovo"],["phone","gold","iphone"]],
# ruleKey = "color", ruleValue = "silver"
# Output: 1
# Explanation: There is only one item matching the given rule,
# which is ["computer","silver","lenovo"].
#
# Example 2:
#
# Input: items = [["phone","blue","pixel"]
# ["computer","silver","phone"],["phone","gold","iphone"]],
# ruleKey = "type", ruleValue = "phone"
# Output: 2
# Explanation: There are only two items matching the given rule,
# which are ["phone","blue","pixel"] and ["phone","gold","iphone"]
# Note that the item ["computer","silver","phone"] does not match.
#

# @param {String[][]} items
# @param {String} rule_key
# @param {String} rule_value
# @return {Integer}
def count_matches(items, rule_key, rule_value)
  counter = 0

  keys = {
    'type' => 0,
    'color' => 1,
    'name' => 2
  }

  items.each do |item|
    position = keys[rule_key]
    counter += 1 if rule_value == item[position]
  end

  counter
end

items = [
  %w[phone blue pixel],
  %w[computer silver lenovo],
  %w[phone gold iphone]
]
rule_key = 'color'
rule_value = 'silver'
puts(count_matches(items, rule_key, rule_value))
# Output: 1

items = [
  %w[phone blue pixel],
  %w[computer silver phone],
  %w[phone gold iphone]
]
rule_key = 'type'
rule_value = 'phone'
puts(count_matches(items, rule_key, rule_value))
# Output: 2

items = []
rule_key = 'type'
rule_value = 'phone'
puts(count_matches(items, rule_key, rule_value))
# Output: 0
