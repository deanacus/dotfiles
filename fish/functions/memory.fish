function memory -a count -d "Find the top memory hogs"
  sudo -v

  set file (mktemp tmp.XXX)
  set sorted (mktemp tmp.XXX)
  set lines 10
  if test -n "$count"
    set lines $count
  end

  echo "PID COMMAND MEMORY" > $sorted

  for line in (command ps -eo pid,%mem,comm --sort=-%mem --no-headers | head -n$lines)
    set pid (echo "$line" | awk '{print $1}')
    set comm (echo "$line" | awk '{print $3}')
    set rawmem (sudo pmap $pid | tail -n1 | awk '{print $2}' | numfmt --from=iec)
    set mem (sudo pmap $pid | tail -n1 | awk '{print $2}' | numfmt --to=iec --from=iec)
    echo "$rawmem $pid $comm $mem" >> $file
  end

  cat $file | sort -bn -k1 -r | awk '{print $2" "$3" "$4}' >> $sorted
  column -t $sorted
  rm $file $sorted
end
