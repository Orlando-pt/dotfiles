alias ssh-personal-key='eval $(ssh-agent -s) && ssh-add ~/.ssh/personal-key'

alias ll='ls -la'

alias gad='git add'
alias gco='git commit -m'
alias gpu='git push'
alias gst='git status'
alias gpl='git pull'
alias gdi='git diff'
alias gre='git restore'
alias gfe='git fetch'
alias gch='git checkout'
alias gbr='git branch'
alias glo='git log'
alias gme='git merge'

# git branch delete with pattern
gbdel() {
  git branch | grep $1 | xargs git branch -$2
}

# only do this steps on macOS
if [[ "$OSTYPE" == "darwin"* ]]; then
  echo "macOS detected"
  # add go bin to path
  export PATH="$PATH:$HOME/go/bin/"

  # tmux
  new-vim-tmux() {
    tmux new "nvim $1"
  }

  tnew() {
    tmux new
  }

  idea() {
    /Applications/IntelliJ\ IDEA.app/Contents/MacOS/idea $1 > /dev/null 2>&1 &
  }

  alias v='nvim'
  export GIT_EDITOR=nvim
fi

# only do this steps on windows ughhhh
if [[ "$OSTYPE" == "Windows_NT"* ]]; then
  echo "Windows detected"

  export GIT_EDITOR=vim
fi
