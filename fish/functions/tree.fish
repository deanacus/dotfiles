function tree -a include
  if test "$include" = "-a"
    exa --tree
  else
    exa --tree --git-ignore
  end
end