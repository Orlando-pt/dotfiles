alias ssh-personal-key='eval $(ssh-agent -s) && ssh-add ~/.ssh/personal-key'

alias ll='ls -la'

# git branch delete with pattern
gbdel() {
  git branch | grep $1 | xargs git branch -d
}
gbdelf() {
  git branch | grep $1 | xargs git branch -D
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
    /Users/orlando.macedo/Applications/IntelliJ\ IDEA\ Ultimate.app/Contents/MacOS/idea $1 > /dev/null 2>&1 &
  }

  export GIT_EDITOR=nvim
fi

alias v='nvim'

