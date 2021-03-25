# You are given a data structure of employee information, which includes the employee's unique id, their importance value and their direct subordinates' id.
#
# For example, employee 1 is the leader of employee 2, and employee 2 is the leader of employee 3. They have importance value 15, 10 and 5, respectively. Then employee 1 has a data structure like [1, 15, [2]], and employee 2 has [2, 10, [3]], and employee 3 has [3, 5, []]. Note that although employee 3 is also a subordinate of employee 1, the relationship is not direct.
#
# Now given the employee information of a company, and an employee id, you need to return the total importance value of this employee and all their subordinates.
#
# Example 1:
#
# Input: [[1, 5, [2, 3]], [2, 3, []], [3, 3, []]], 1
# Output: 11
# Explanation:
# Employee 1 has importance value 5, and he has two direct subordinates: employee 2 and employee 3. They both have importance value 3. So the total importance value of employee 1 is 5 + 3 + 3 = 11.
#
# Note:
#
# One employee has at most one direct leader and may have several subordinates.
# The maximum number of employees won't exceed 2000.

class Employee
  attr_accessor :id, :importance, :subordinates

  def initialize(id, importance, subordinates)
    @id = id
    @importance = importance
    @subordinates = subordinates
  end
end

#
# Approach 1: DFS
#

# Intuition and Algorithm

# Let's use a hashmap emap = {employee.id -> employee} to query employees quickly.
# Now to find the total importance of an employee, it will be the importance of that employee,
# plus the total importance of each of that employee's subordinates.
# This is a straightforward depth-first search.

# Complexity Analysis

# Time Complexity: O(N), where N is the number of employees.
# We might query each employee in dfs.
# Space Complexity: O(N), the size of the implicit call stack when evaluating dfs.

# @param {Employee} employees
# @param {Integer} id
# @return {Integer}
def get_importance(employees, id, ans = 0)
  manager = employees.find { |emp| emp.id == id }
  ans = manager.importance
  manager.subordinates.each do |sub|
    ans += get_importance(employees, sub, ans)
  end
  ans
end

employee1 = Employee.new(1, 5, [2, 3])
employee2 = Employee.new(2, 3, [])
employee3 = Employee.new(3, 3, [])
puts get_importance([employee1, employee2, employee3], 1)
# Output: 11


#
# Approach 2: BFS
#

# @param {Employee} employees
# @param {Integer} id
# @return {Integer}
def get_importance(employees, id)
  ans = 0
  manager = employees.find { |emp| emp.id == id }
  queue = [manager.subordinates]
  ans = manager.importance
  while !queue.empty?
    curr = queue.shift
    curr.each do |id|
      emp = employees.find { |e| e.id == id }
      ans += emp.importance
      queue.push(emp.subordinates) unless emp.subordinates.empty?
    end
  end
  ans
end

employee1 = Employee.new(1, 5, [2, 3])
employee2 = Employee.new(2, 3, [])
employee3 = Employee.new(3, 3, [])
puts get_importance([employee1, employee2, employee3], 1)
# Output: 11
