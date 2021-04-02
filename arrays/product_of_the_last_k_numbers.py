# 1352. Product of the Last K Numbers

# The idea is to maintain the product of the numbers so far. When getting the product of the last k elements, we know for a fact that we have a running product stored in our array. We can simply divide the latest product the value at index n - k -1 (where n is the length of the array).
#
# Example:
#
# Suppose we did add(1), add(3), add(5), add(7). Array looks like:
# nums = [1, 3, 15, 105]
#
# Now suppose we call get(2):
# nums = [1, 3, 15, 105]
#            ^       ^
#        n - k - 1   n
#
# If we look at the numbers we inserted, [1, 3, 5, 7] we see that get(2) should return 35 because 7 * 5 = 35.
# Dividing the latest product with the product `k` places ago (in this case 2 places ago) gives us exactly that.
#
# Formally:
# [....., x, x + 1, x + 2]
# At position x, we know it's the product of everything inclusive of x and before.
# Last element is x * (x + 1) * (x + 2)
#
# get(2)
#   -> Last element // element 2 positions ago:
#   -> [x * (x + 1) * (x + 2) / (x)] = [(x + 1) * (x + 2)]
# Code:

class ProductOfNumbers:
    def __init__(self):
        self.nums = [1]

    def add(self, num: int) -> None:
        if not num: self.nums = [1]
        else: self.nums.append(num * self.nums[-1])

    def getProduct(self, k: int) -> int:
        if k >= len(self.nums): return 0
        return self.nums[-1] // self.nums[len(self.nums) - k - 1]
