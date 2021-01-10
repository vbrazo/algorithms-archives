# Linear Search

- [Linear Search](#linear-search)
  - [Linear search in an array](#linear-search-in-an-array)
  - [Linear search in a linked list](#linear-search-in-a-linked-list)
  - [Linear search in a binary tree](#linear-search-in-a-binary-tree)
  - [Linear search in a graph](#linear-search-in-a-graph)
  - [Naive search in a string](#naive-search-in-a-string)

Given an array of numbers `int` and a number `x`. Search for `x` in the array and return `true` if it is present, `false` otherwise.

We can traverse the array in either forward order starting with first element until the end or start with last element and move backward until we hit the first element.

## Linear search in an array

The following C code in worst case, when element is not found in array or is found at last position, loop executes n times. This code takes O(n) time in worst case. In best case, when element is found at first position, it takes constant time, O(1). Average case is when element is found in the middle. It requires n/2 comparisons and takes O(n) time. Extra memory taken by it is constant.

- [One Dimensional in C](c/linear_search.c)
- [Two Dimensional in C](c/linear_search_in_two_dimensional.c)

Just keep in mind that recursive code almost always takes more time and more memory than corresponding non-recursive code.

- [Recursive in C](c/recursive_linear_search.c)

A full traverse takes O(n) in best, worst and average case.

- [Full traverse in C](c/full_traverse.c)

## Linear search in a linked list

Given a linked list, determine whether an element is present or not.

- [Linear search in a linked list](c/linear_search_in_a_linked_list.c)

## Linear search in a binary tree

## Linear search in a graph

## Naive search in a string
