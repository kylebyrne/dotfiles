. "$HOME/.config/fish/functions/git.fish"
. "$HOME/.config/fish/functions/aliases.fish"

export PATH="$HOME/.cargo/bin:$PATH"


# setup rbenv
set PATH $HOME/.rbenv/bin $PATH
set PATH $HOME/.rbenv/shims $PATH
rbenv rehash >/dev/null ^&1
# to make Ruby faster http://tmm1.net/ruby21-rgengc/?utm_source=rubyweekly&utm_medium=email
set -x  RUBY_GC_HEAP_INIT_SLOTS 600000
set -x  RUBY_GC_HEAP_FREE_SLOTS 600000
set -x  RUBY_GC_HEAP_GROWTH_FACTOR 1.25
set -x  RUBY_GC_HEAP_GROWTH_MAX_SLOTS 300000

set -gx TERM xterm-256color

# # make Vim the default editor
# set --export EDITOR "nvim"

# # make Vim usable with git
# set --export GIT_EDITOR "nvim"
#
if  set -q NVIM_LISTEN_ADDRESS
  set --export GIT_EDITOR "nvr -cc split --remote-wait +'set bufhidden=wipe'"
  set --export EDITOR "nvr -cc split --remote-wait +'set bufhidden=wipe'"
else
  set --export GIT_EDITOR "nvim"
  set --export EDITOR "nvim"
end

function fishrc
  cd ~/.config/fish
  vim ~/.config/fish/config.fish
end

function refish
  source ~/.config/fish/config.fish
end

set PATH /usr/local/opt/qt@5.5/bin $PATH

function brspec
  set TEST_IN_BROWSER 1
  rspec $argv
  set TEST_IN_BROWSER 0
end

# set -g fish_user_paths "/usr/local/opt/openssl@1.1/bin" $fish_user_paths

starship init fish | source
