alias ssh-personal-key='eval $(ssh-agent -s) && ssh-add ~/.ssh/personal-key'
alias v='nvim'

export GIT_EDITOR=nvim

alias gia='git add'
alias gic='git commit -m'
alias gip='git push'
alias gis='git status'
alias gipl='git pull'
alias gid='git diff'
alias gir='git restore'
alias gif='git fetch'
alias gich='git checkout'
alias gib='git branch'
alias gil='git log'
alias gim='git merge'

idea() {
  /Applications/IntelliJ\ IDEA.app/Contents/MacOS/idea $1 > /dev/null 2>&1 &
}

# tmux
new-vim-tmux() {
  tmux new "nvim $1"
}

tnew() {
  tmux new
}

# git branch delete with pattern
gibd() {
  git branch | grep $1 | xargs git branch -$2
}
