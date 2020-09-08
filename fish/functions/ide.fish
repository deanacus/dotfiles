function ide
  # Get the width of the screen
  set -l screen_width (tmux display -p '#{window_width}')
  # The small panes will be a third the width of the window
  set -l small_pane_width (math $screen_width / 3)

  # New tmux session
  tmux new
  # Split into two halves horizontally
  tmux split-window -h
  # Split the second half into two halves. These are the small panes
  # tmux split-window
  # Resize the small panes
  tmux resize-pane -x $small_pane_width

  tmux split-window -v \; \
  tmux attach
end

# tmux new-session -s Wide \; \
#     select-pane -t 0 \; \
#     split-window -h -p 33 \; \
#     select-pane -t 0 \; \
#     attach