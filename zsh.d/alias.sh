### Aliases ###

# Colorized and classified file listings
alias ls="ls -FG"

# Colorized and classified file listings using non-BSD version of ls
# alias ls="ls -F --color=auto"

# Show hidden files with human-readable size in list form
alias la="ls -lah"

# Open Mac OSX emacs
if [[ -x /usr/local/Cellar/emacs/24.5/bin ]] ; then
  alias gmacs="/usr/local/Cellar/emacs/24.5/Emacs.app/Contents/MacOS/Emacs"
  alias emacs="/usr/local/Cellar/emacs/24.5/bin/emacs"
  alias emacsclient="/usr/local/Cellar/emacs/24.5/bin/emacsclient"
fi

if [ -n "$INSIDE_EMACS" ]; then
  alias emacs="emacs-within-emacs"
fi

function emacsd() {
  if [ -z "$(ps aux | grep -p '[Ee]macs.*--daemon')" ] ; then
    emacs --daemon
  fi
}

function emacst() {
  emacsclient -t --eval "(multi-term)"
}

function emacs-within-emacs() {
  emacsclient -n "$@"
}

# Make directory navigation easier
alias ..="cd ../"
alias ...="cd ../.."
alias ....="cd ../../.."

# Vagrant alias
alias v="vagrant"

# Useful bundle shorcuts
alias brb="bundle console"

alias b="bundle"

function bx() {
  bundle exec "$@"
}

function bk() {
  bundle exec knife "$@"
}

function bake() {
  bundle exec rake "$@"
}

function bspec() {
  bundle exec rspec "$@"
}

function bcuc() {
  bundle exec cucumber "$@"
}

# Git and gist shortcuts
alias g="git"

function gst() {
  gist -c -f "$@" < "$@"
}

# Random alphanumeric password generator
# Specify an output length as an argument, defaults to 8
function randpwd() {
  length=${1:-8}
  openssl rand -base64 128 | tr -cd "[:alnum:]" | head -c $length ; echo
}
