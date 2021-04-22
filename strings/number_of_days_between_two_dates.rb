def day(y, m, d)
  yd = 365 * (y-1970)
  for i in range(1970, y)
    if i % 4 == 0
      yd += 1
    end
  end

  month = [31,28,31,30,31,30,31,31,30,31,30,31]
  md = month.sum
  if y % 4 == 0 and y != 2100 and m > 2
    md += 1
  end

  return yd + md + d
end

y1 = int(date1[:4])
m1 = int(date1[5:7])
d1 = int(date1[8:])

y2 = int(date2[:4])
m2 = int(date2[5:7])
d2 = int(date2[8:])

days1 = day(y1, m1, d1)
days2 = day(y2, m2, d2)

return abs(days1-days2)
