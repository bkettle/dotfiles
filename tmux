set -sg escape-time 0

# remap prefix from 'C-b' to 'C-a'
unbind C-b
set-option -g prefix C-a
bind-key C-a send-prefix

set -g default-terminal "screen-256color"
set -g status-bg blue
set -g status-fg black

set -g mouse on
