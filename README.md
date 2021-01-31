# Algorithms Archives

This is my personal algorithms archives and it's where I store my algorithms research that aims to provide resources to better interview developers in my engineering management journey.

- [Algorithms](#algorithms)
  - [Backtracking](#backtracking)
  - [Bit Manipulation](#bit-manipulation)
  - [Dynamic Programming](#dynamic-programming)
  - [Recursion](#recursion)
  - [Searching](#searching)
    - [Linear Search](#linear-search)
    - [Binary Search](#binary-search)
  - [Sorting](#sorting)
    - [In-place Algorithm](#in-place-algorithm)
    - [Bubble Sort](#bubble-sort)
    - [Selection Sort](#selection-sort)
    - [Merge Sort](#merge-sort)
    - [Quick Sort](#quick-sort)
    - [Radix Sort](#radix-sort)

# Algorithms

## Backtracking

Backtracking is an effective technique for solving algorithmic problems. In backtracking, we perform a depth-first search for solutions, jumping back to the last valid path as soon as we hit a dead end.

The benefit of backtracking is that when it is properly implemented, we are guaranteed to find a solution, if one exists. Further, the solution will be more efficient than a brute-force solution exploration, since we weed out paths that are known to be invalid, a process knwon as prunning.

On the other hand, backtracking cannot guarantee that we will find an optimal solution, and it often leads to factorial or exponential time complexity if we are required to choose one of M paths at each of N steps.

There are three core questions to ask in order to determine whether backtracking is the right algorithm to use for a problem.

1. Can you construct a partial solution?
2. Can you verify if the partial solution is invalid?
3. Can you verify if the solution is complete?

To illustrate this concept, we will walk through one of the most common example of backtracking: the N queens puzzle. In this problem, you are given a N x N board and asked to find the number of way N queens can be placed on the board without threatening each other. More explicitly, no two queens are allowed to share the same row, column, or diagonal.

- Can we construct a partial solution?

Yes, we can tentatively place queens on the board.

- Can we verify if th epartial solution is invalid?

Yes, we can check a solution is invalid if two queens threaten each other. To speed this up, we can ssume that all queens already placed so far do not threaten each other, so we only need to check if the last queen we added attacks any other quee.

- Can we verify if the solution is complete?

Yes, we know a solution is complete if all N queens have been placed.

```python
def n_queens(n, board=[]):
  if n == len(board):
    return 1

  count = 0
  for col in range(n):
    board.append(col)
    if is_valid(board):
      count += n_queens(n, board)
     board.pop()
   return count

def is_valid(board):
  current_queen_row, current_queen_col = len(board) - 1, board[-1]

  # check if any queens can attack the last queen
  for row, col in enumerate(board[:-1]):
    diff = abs(current_queen_col - 1)
    if diff == 0 or diff = current_queen_row - row:
      return False
  return True
```

## Bit Manipulation

What's a bit? A bit, short for binary digit, is either `0` or `1`. String a bunch of these bits together, and you can represent any integer. Each place value, starting from the right column and extending left, represents a power of two, so that `00000101` stands for 5 (2⁰ + 2²). In this example, we've represented 5 as an 8-bit number, and most of the bits are zero, or "off".

To negate an n-bit number, we use an operation called two's complement, which is to say we invert all the bits and then add one. As a result, 5 would become 11111011.

Bits are useful because they provide an extremely fast and space-efficient way of calculating numerical operations. In particular, you should be familiar with the following three operators:

- `& (AND)`

The bitwise `AND` takes two integers as input and produces a third integer whose bits are 1 if an only if both corresponding input bits are 1.

For example, 00000101 & 00011110 = 00011111.

- `^(XOR)`

The bitwise `XOR` takes two integers as input and produces a third integer whose bits are 1 if the corresponding input bits are different. That is, for each place one of the input integers must be 0 and the other must be 1.

For example, 00000101 ^ 000111110 = 00011011.

Bits also provide a quick way of multiplying or dividing a number by powers of two. This method is called `bitshifting`, and is represented by the symbols << and >>. In effect, << inserts zeros at the right end of the bit, so that each corresponding bit is shifted to the left. Conversely, >> can be thought of as inserting zeros at the left end of the bit, pushing elements rightward.

Here are some bitshifts in action:

5 << 2 = 20 (00000101 << 2 = 00010100)

5 >> 2 = 1 (00000101 >> 2 = 00000001)

Note that in the last example, when we "push" the last two bits to the right, they essentially disappear.

## Dynamic Programming

## Recursion

Recursion is an important concept in computer science. It is a foundation for many other algorithms and data structures.

## Searching

### Linear Search

Linear search is the simplest algorithm used to search sequentially in a collection. It traverses the given collection linearly and compare each element with value being searched until value is found and or we hit the end of collection.

Only thing required is a logic to traverse given collection linearly. Some data structures like array, linked list, queue, stack, etc are sequential in the way they arrange data within themselves. Traversing such data structures linearly is natural and easy. For example, an array can be traversed linearly from either left-to-right or right-to-left, the sequence is deterministic and very intuitive. But if collection is a Binary tree, we can traverse the nodes sequentially in multiple ways, in-order, pre-order, post-order, level-order, reverse-level-order, etc.

In this section, I'm reviewing different collection where we apply linear search algorithms.

- [Linear Search](algorithms/searching/linear-search/README.md)
  - [Linear search in an Array](algorithms/searching/linear-search/README.md#linear-search-in-an-array)
  - [Linear search in a linked list](algorithms/searching/linear-search/README.md#linear-search-in-a-linked-list)
  - [Linear search in a binary tree](algorithms/searching/linear-search/README.md#linear-search-in-a-binary-tree)
  - [Linear search in a graph](algorithms/searching/linear-search/README.md#linear-search-in-a-graph)
  - [Naive search in a string](algorithms/searching/linear-search/README.md#naive-search-in-a-string)

### Binary Search

Binary Search is one of the most fundamental and useful algorithms in Computer Science. It describes the process of searching for a specific value in an ordered collection.

In its simplest form, Binary Search operates on a contiguous sequence with a specified left and right index. This is called the Search Space. Binary Search maintains the left, right, and middle indicies of the search space and compares the search target or applies the search condition to the middle value of the collection; if the condition is unsatisfied or values unequal, the half in which the target cannot lie is eliminated and the search continues on the remaining half until it is successful. If the search ends with an empty half, the condition cannot be fulfilled and target is not found.

Terminology used in Binary Search:

- Target - the value that you are searching for
- Index - the current location that you are searching
- Left, Right - the indicies from which we use to maintain our search Space
- Mid - the index that we use to apply a condition to determine if we should search left or right

Wikipedia: https://en.wikipedia.org/wiki/Binary_search_algorithm

## Sorting

### In-place Algorithm

An in-place algorithm is an algorithm which transforms input using no auxiliary data structure. However, a small amount of extra storage space is allowed for auxiliary variables. The input is usually overwritten by the output as the algorithm executes. In-place algorithm updates input sequence only through replacement or swapping of elements. An algorithm which is not in-place is sometimes called not-in-place or out-of-place.

Reference: https://en.wikipedia.org/wiki/In-place_algorithm

### Bubble Sort

Bubble Sort is one of the most basic sorting algorithms. It is not used very often in practice other than explaining sorting to beginners. Selection sort, in a way, is a variation of bubble sort used where write to disk is costly.

Each iteration in bubble sort compares adjacent elements successively and move the larger one toward right by swapping them.

The time complexity of a bubble sort is `O(n^2)`.

### Selection Sort

Selection Sort is a variation of Bubble Sort where swapping happens only once per pass.
Each pass identify largest element in current array and swap it with element
at last position. Number of comparison are same as that of Bubble Sort,
but number of swaps are `O(n)`.

An important observation about selection sort is that for an array of
size `n`, it performs only `O(n)` swap operations in worst case.
This makes Selection Sort a sorting algorithm that makes minimum number of writes
on the disk. If write operation is expensive, selection sort is a good choice.

The most optimal sorting algorithm in terms of number of write operations is `cycle sort`.
But, it is not a stable sorting algorithm.

The time complexity of a selection sort is `O(n^2)` time in best, worst and average
case. The extra memory taken is constant, because our implementation is non-recursive.
The recursive implementation takes `O(n)` extra memory.

Common implementation of Selection Sort is observed to be taking almost half
the time taken by Bubble Sort.

### Merge Sort

Merge Sort divides the array in half, sorts each of those halves, and then merges them back
together. Each of those halves has the same sorting algorithm applied to it. Eventually,
you are merging just two single element arrays. It is the "merge" part that does
all the heavy lifting.

The merge method operates by copying all the elements from the target array segment
into a helper array, keeping track of where the start of the left and right halves should
be (helperLeft and helperRight). We then iterate through helper, copying the smaller
element from each half into the array. At the end, we copy an remaining elements into the
target array.

### Quick Sort

In Quick Sort, we pick a random element and partition the array, such all numbers that
are less than the partitioning element come before all elements that are great than it.
The partitioning can be performed efficiently through a series of swaps.

If we repeatedly partition the array (and its sub-arrays) around and element, the array
will eventually become sorted. However, as the partitioned element is not guaranteed to be
the median (or anywhere near the median), our sorting could be very slow. This is the reason
for the `O(n^2)` worst case scenario.

### Radix Sort

Radix sort is a sorting algorithm for integers (and some other data types) that takes
advantage of the fact that integers have a finite number of bits. In radix sort, we iterate
through each digit of the number, grouping numbers by each digit. For example, if we have
an array of integers, we might first sort by the first digit, so that the 0s are grouped
together. Then, we sort each of these groupings by the next digits. we repeat this process
sorting by each subsequent digit, until finally the whole array is sorted.

Unlike comparison sorting algorithms, which cannot perform better than `O(n log(n))` in the
average case, radix sort has a runtime of `O(kn)`, where `n` is number of elements and `k`
is the number of passes of the sorting algorithm.
