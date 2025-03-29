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
  idea() {
    /Applications/IntelliJ\ IDEA.app/Contents/MacOS/idea $1 > /dev/null 2>&1 &
  }

  export GIT_EDITOR=nvim
fi

alias v='nvim'

