#include <stdio.h>

int main()
{
  int mark[2][4] = {
      {10, 11, 12, 13},
      {14, 15, 16, 17}
  };

  int x = 10;
  int cols = sizeof(mark);
  int rows = sizeof(mark) / sizeof(mark[0]);

  for(int i = 0; i < rows; i++)
  {
    for(int j = 0; j < cols; j++)
    {
      if (mark[i][j] == x)
      {
        printf("found");
        exit(0);
      }
    }
  }

  printf("not found");
}
