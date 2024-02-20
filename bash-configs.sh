alias ssh-personal-key='eval $(ssh-agent -s) && ssh-add ~/.ssh/personal-key'

alias ll='ls -la'

# git branch delete with pattern
gbdel() {
  git branch | grep $1 | xargs git branch -$2
}

# only do this steps on macOS
if [[ "$OSTYPE" == "darwin"* ]]; then
  echo "macOS detected"

  export GOPATH=$HOME/go
  export GOROOT="/opt/homebrew/opt/go/libexec"
  export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin" # add go bin to path

  export PATH="$PATH:/opt/homebrew/bin"
  export PATH="$PATH:$HOME/Library/Python/3.9/bin"

  export PATH="$HOME/.jenv/bin:$PATH"
  eval "$(jenv init -)"

  # tmux
  new-vim-tmux() {
    tmux new "nvim $1"
  }

  idea() {
    /Applications/IntelliJ\ IDEA.app/Contents/MacOS/idea $1 > /dev/null 2>&1 &
  }

  alias v='nvim'
  export GIT_EDITOR=nvim
fi


