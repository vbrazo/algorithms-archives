# Algorithms Archives

This is my personal algorithms archives and it's where I store my algorithms research that aims to provide resources to better interview developers in my engineering management journey.

- [Algorithms](#algorithms)
  - [Searching](#searching)
    - [Linear Search](#linear-search)
    - [Binary Search](#binary-search)
    - [Other Search Algorithms](#other-search-algorithms)
  - [Sorting](#sorting)
    - [Introduction](#introduction)
    - [In-place Algorithm](#in-place-algorithm)
    - [Bubble and Selection Sort](#bubble-and-selection-sort)
      - [Bubble Sort](#bubble-sort)
      - [Selection Sort](#selection-sort)
    - [Quick Sort](#quick-sort)
    - [Merge Sort](#merge-sort)
    - [Heap Sort](#heap-sort)
    - [Non-Comparison Sorting](#non-comparison-sorting)
    - [Last Word on Sorting](#last-word-on-sorting)
  - [Recursion](#recursion)
  - [Dynamic Programming](#dynamic-programming)
  - [Backtracking](#backtracking)
  - [Pathfinding](#pathfinding)
  - [Bit Manipulation](#bit-manipulation)
  - [Randomized Algorithms](#randomized-algorithms)
  - [Advanced Algorithms](#advanced-algorithms)

# Algorithms

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

### Other Search Algorithms

## Sorting

### Introduction

## In-place Algorithm

An in-place algorithm is an algorithm which transforms input using no auxiliary data structure. However, a small amount of extra storage space is allowed for auxiliary variables. The input is usually overwritten by the output as the algorithm executes. In-place algorithm updates input sequence only through replacement or swapping of elements. An algorithm which is not in-place is sometimes called not-in-place or out-of-place.

Reference: https://en.wikipedia.org/wiki/In-place_algorithm

### Bubble and Selection Sort

Bubble Sort is one of the most basic sorting algorithms. It is not used very often in practice other than explaining sorting to beginners. Selection sort, in a way, is a variation of bubble sort used where write to disk is costly.

#### Bubble Sort

Each iteration in bubble sort compares adjacent elements successively and move the larger one toward right by swapping them.

The time complexity of a bubble sort is `O(n^2)`.

### Selection Sort

Selection Sort is a variation of Bubble Sort where swaping happens only once per pass.
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

### Quick Sort

### Merge Sort

### Heap Sort

### Non-Comparison Sorting

### Last Word on Sorting

## Recursion

Recursion is an important concept in computer science. It is a foundation for many other algorithms and data structures.

## Dynamic Programming

## Backtracking

## Pathfinding

## Bit Manipulation

## Randomized Algorithms

## Advanced Algorithms
