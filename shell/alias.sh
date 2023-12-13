alias cp="cp -i"                                                # Confirm before overwriting something
alias mv="mv -i"
alias df='df -h'                                                # Human-readable sizes
alias free='free -m'                                            # Show sizes in MB
alias gitu='git add . && git commit && git push'
alias nh="nohup"
alias ssh='TERM=xterm-color ssh'
alias la='ls -alh --color=auto'
alias rm='rm -i'
alias ec="emacsclient -nc"
alias j="just"
alias g="git"
alias -g gitprune="git fetch -p ; git branch --merged | egrep -v '(main|develop|release|master)' | xargs git branch -d"
alias gs = "git status"

# cd to git root directory
alias cdgr='cd "$(git root)"'

# Create a directory and cd into it
mcd() {
    mkdir "${1}" && cd "${1}"
}

# git fuzzy checkout - from https://stackoverflow.com/questions/36513310/how-to-get-a-gits-branch-with-fuzzy-finder
gfc() {
  local branches branch
  branches=$(git branch -vv --sort=-committerdate) &&
  branch=$(echo "$branches" | fzf +m) &&
  git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}

