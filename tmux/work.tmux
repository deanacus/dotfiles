# session=vmain

# if [ ! -z $1 ]; then
#   $session=$1
# fi

# tmux new-session -s $session \; \
#   select-pane -t 0 \; \
#   split-window -h -p 25 \; \
#   split-window -v \; \
#   send-keys "vim ~/.todo.txt" Enter
#   select-pane -t 0 \; \
#   attach

#session1
new -s Work -n WindowName Command
neww -n foo/bar foo
splitw -v -p 50 -t 0 bar
selectw -t 1
selectp -t 0