function today -d "Print todays date"
  set -l year (date +%Y)
  set -l month (date +%m)
  set -l day (date +%d)
  echo $year-$month-$day
end