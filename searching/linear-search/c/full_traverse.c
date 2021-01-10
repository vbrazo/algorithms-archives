#include <stdio.h>

int linearSearch(int *arr, int n, int x)
{
    for(int i = 0; i < n; i++)
    {
        if (arr[i] == x)
            printf("%d\n", x);
    }

}

int main()
{
  int mark[5] = {19, 10, 8, 9, 9, 10, 10};
  int x = 9;

  linearSearch(mark, sizeof(mark), x);
}
