// Linear Search in an array in C

#include <stdio.h>

int linearSearch(int *arr, int n, int x)
{
  for(int i = 0; i < sizeof(arr); i++)
  {
    if(arr[i] == x)
      return 1;
  }

  return 0;
}

void output(int result)
{
  if (result == 1)
  {
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
