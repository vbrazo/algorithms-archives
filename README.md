# Algorithms Archives

This is my personal algorithms archives and it's where I store my algorithms research that aims to provide resources to better interview developers in my engineering management journey.

- [Algorithms](#algorithms)
  - [Backtracking](#backtracking)
  - [Bit Manipulation](#bit-manipulation)
  - [Dynamic Programming](#dynamic-programming)
  - [Pathfinding](#pathfinding)
  - [Recursion](#recursion)
  - [Searching](#searching)
    - [Linear Search](#linear-search)
    - [Binary Search](#binary-search)
  - [Sorting](#sorting)
    - [In-place Algorithm](#in-place-algorithm)
    - [Bubble and Selection Sort](#bubble-and-selection-sort)
      - [Bubble Sort](#bubble-sort)
      - [Selection Sort](#selection-sort)
    - [Heap Sort](#heap-sort)
    - [Merge Sort](#merge-sort)
    - [Quick Sort](#quick-sort)
    - [Radix Sort](#radix-sort)
    - [Shell Sort](#shell-sort)

# Algorithms

## Backtracking

## Bit Manipulation

## Dynamic Programming

## Pathfinding

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

## Sorting

### In-place Algorithm

An in-place algorithm is an algorithm which transforms input using no auxiliary data structure. However, a small amount of extra storage space is allowed for auxiliary variables. The input is usually overwritten by the output as the algorithm executes. In-place algorithm updates input sequence only through replacement or swapping of elements. An algorithm which is not in-place is sometimes called not-in-place or out-of-place.

Reference: https://en.wikipedia.org/wiki/In-place_algorithm

### Bubble and Selection Sort

Bubble Sort is one of the most basic sorting algorithms. It is not used very often in practice other than explaining sorting to beginners. Selection sort, in a way, is a variation of bubble sort used where write to disk is costly.

#### Bubble Sort

Each iteration in bubble sort compares adjacent elements successively and move the larger one toward right by swapping them.

The time complexity of a bubble sort is `O(n^2)`.

#### Selection Sort

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

### Heap Sort

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

### Shell Sort
