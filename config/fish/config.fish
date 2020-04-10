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


function fishrc
  cd ~/.config/fish
  vim ~/.config/fish/config.fish
end

function refish
  source ~/.config/fish/config.fish
end

set PATH /usr/local/opt/qt@5.5/bin $PATH

starship init fish | source
