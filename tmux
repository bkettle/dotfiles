# don't wait for escape sequences
set -sg escape-time 0

# remap prefix from 'C-b' to 'C-a'
unbind C-b
set-option -g prefix C-a
bind-key C-a send-prefix

set -g default-terminal "screen-256color"
set -g status-bg blue
set -g status-fg black

# enable mouse support
set -g mouse on

# act like vim
setw -g mode-keys vi
bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R

bind -T copy-mode-vi "v" send -X begin-selection
bind -T copy-mode-vi "V" send -X rectangle-toggle
bind -T copy-mode-vi "y" send -X copy-selection-and-cancel

# easy resizing of panes
bind -r J resize-pane -D 5
bind -r K resize-pane -U 5
bind -r H resize-pane -L 5
bind -r L resize-pane -R 5

# start window numbers at 1 to match keyboard order with tmux order
set -g base-index 1

# start pane numbers at 1 to match keyboard order with tmux order
setw -g pane-base-index 1

# create new windows/panes in same directory
bind c new-window -c "#{pane_current_path}"
bind "\"" split-window -c "#{pane_current_path}"
bind % split-window -h -c "#{pane_current_path}"

# increase scrollback lines
set -g history-limit 65536

# renumber windows sequentially after closing any of them
set -g renumber-windows on

# easily clear history (for looking through output, etc)
bind C-k clear-history \; display-message "history cleared"

# clear screen and clear history with a single keypress
bind C-b send-keys -R ^M \; clear-history \; display-message "history and screen cleared"

# reload the .tmux.conf file with Ctrl-r
bind C-r source-file ~/.tmux.conf \; display-message "configuration reloaded"

