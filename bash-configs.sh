alias ssh-personal-key='eval $(ssh-agent -s) && ssh-add ~/.ssh/personal-key'

alias ll='ls -la'

# git branch delete with pattern
gbdel() {
  git branch | grep $1 | xargs git branch -d
}
gbdelf() {
  git branch | grep $1 | xargs git branch -D
}

gcmsgb() {
  branch_name=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)

  if [ -z "$branch_name" ]; then
    echo "Not in a Git repository."
    return 1
  fi

  if [ -z "$1" ]; then
    echo "No commit message provided."
    return 1
  fi

  feature_name=$(echo "$branch_name" | cut -d'/' -f2)

  if [[ -n "$2" && $2 = true ]] ; then
    git commit --amend -m "$feature_name: $1"
  else
    git commit -m "$feature_name: $1"
  fi
}

# maven wrapper
mvnf() {
  if [[ -n "$2" && $2 = true ]] ; then
    ./mvnw clean test -Dtest="$1"
  else
    ./mvnw test -Dtest="$1"
  fi
}

mvnboot() {
  ./mvnw spring-boot:run
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

# increase specs version
alias inc-specs='./mvnw org.codehaus.mojo:build-helper-maven-plugin:3.4.0:parse-version versions:set -DnewVersion=\${parsedVersion.majorVersion}.\${parsedVersion.minorVersion}.\${parsedVersion.nextIncrementalVersion} -DgenerateBackupPoms=false -q'

