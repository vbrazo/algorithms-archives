require "date"

def days_between_dates(date1, date2)
  date1 = Date.parse(date1).to_datetime.strftime("%s").to_i
  date2 = Date.parse(date2).to_datetime.strftime("%s").to_i
  return (date2 - date1).abs / (60*60*24)
end

date1 = "2019-06-29"
date2 = "2019-06-30"
puts days_between_dates(date1, date2)
# Output: 1

date1 = "2020-01-15"
date2 = "2019-12-31"
puts days_between_dates(date1, date2)
# Output: 15
