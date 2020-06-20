#!/bin/bash

GIT_CONFIG="$HOME/.gitconfig"
GIT_TRANSLATION_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
GIT_TRANSLATION_CONFIG_FILE="$GIT_TRANSLATION_DIR/aliases"

function get_config_string () {
  language=$1

  cat <<EOF
# the following include was inserted by git-translation project
[include]
  path = $GIT_TRANSLATION_CONFIG_FILE/$language
EOF
}

function install() {
  language=${1:-"hu"}
  config=$(get_config_string $language)

  if grep -Fq "$config" "$GIT_CONFIG"
  then
    echo "Some translation is already installed, exiting..."
    exit;
  fi

  echo Installing aliases

  echo "$config" >> $GIT_CONFIG
}

remove() {
  language=${1:-"hu"}
	file=$GIT_CONFIG
	from=$(grep -n '# the following' "$file" | cut -d ':' -f 1)
	to=$(( from + 2 ))
	THE_DIFF=$(cat << EOF
${from},${to}d1
< # the following include was inserted by git-translation project
< [include]
<   path = $GIT_TRANSLATION_CONFIG_FILE/$language
EOF
          )
  echo "$THE_DIFF" | patch -p0 "$file"
}

function help() {
  cat <<EOF
The follwing commands are available:
  intall - install the alias config in your gitconfig
  remove - opposite of install

For both commands you can provide a language option but at the moment it will
only work with "hu" for hungarian language.
EOF
}

function main() {
  case "$1" in
    "install")
      install $2
      ;;
    "remove")
      remove $2
      ;;
    "help" | "" | *)
      help
      ;;
  esac
}

main $@
