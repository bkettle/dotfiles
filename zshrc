source ~/.shell/alias.sh
source ~/.zsh/prompt.zsh
source ~/.zsh/bindings.zsh
source ~/.shell/plugins/fzf-git.sh
source ~/.zsh/settings.zsh
source ~/.zsh/theme.zsh
source ~/.zshrc_local # non-version-controlled configuration

source ~/.dotfiles/scripts/z/z.sh

export PATH="$PATH:$HOME/bin"

export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"

. "$HOME/.local/bin/env"

# bun completions
[ -s "/Users/ben/.bun/_bun" ] && source "/Users/ben/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

