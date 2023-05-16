alias ssh-personal-key='eval $(ssh-agent -s) && ssh-add ~/.ssh/personal-key'

alias ll='ls -la'

# git branch delete with pattern
gbdel() {
  git branch | grep $1 | xargs git branch -$2
}

# only do this steps on macOS
if [[ "$OSTYPE" == "darwin"* ]]; then
  echo "macOS detected"
  # add go bin to path
  export PATH="$PATH:$HOME/go/bin/"
  export PATH="$PATH:/opt/homebrew/bin"

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
