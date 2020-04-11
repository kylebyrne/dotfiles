export PATH="$HOME/.cargo/bin:$PATH"

# Aliases
alias vi="nvim"
alias vim="nvim"

# Turn off complete aliases to work with SCM Breeze
setopt no_complete_aliases

# Set TERM to allow tmux to work with alacritty
export TERM=xterm-256color

# Setup for autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# SCM Breeze install
# [ -s "$HOME/.scm_breeze/scm_breeze.sh" ] && source "$HOME/.scm_breeze/scm_breeze.sh"
[ -s "/Users/kylebyrne/.scm_breeze/scm_breeze.sh" ] && source "/Users/kylebyrne/.scm_breeze/scm_breeze.sh"


# Initialize nvm
export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Initialize fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_COMMAND="rg --files --follow --hidden --glob '!.git/*' --glob \
  '!sorbet/**' --glob '!tags' --glob '!yarn.lock' --glob '!package.json'"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

export EDITOR=/usr/local/bin/nvim

# Initialize rbenv
eval "$(rbenv init -)"

# Initialize starship prompt
eval "$(starship init zsh)"
