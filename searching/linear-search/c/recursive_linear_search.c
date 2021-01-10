// Linear Search in an array in C

#include <stdio.h>

int linearSearch(int *arr, int n, int x)
{
  if(n == 0)
    return 0;

  if(arr[0] == x)
    return 1;

  return linearSearch(arr + 1, n - 1, x);
}

void output(int result)
{
  if (result == 1) {
    printf("Element found\n");
  } else {
    printf("Element not found\n");
  }
}

int main()
{
  int mark[5] = {19, 10, 8, 17, 9};
  int x = 10;

  int found = linearSearch(mark, sizeof(mark), x);

  output(found);

  int y = 110;
  int not_found = linearSearch(mark, sizeof(mark), y);

  output(not_found);
}
