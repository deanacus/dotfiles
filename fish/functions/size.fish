function size -a path -d "Print the human readable size of the current directory"
  if test $path
    du -sh $path | awk '{print $1}'
  else
    du -sh $path | awk '{print $1}'
  end
end