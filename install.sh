#!/bin/bash

GIT_CONFIG="$HOME/.gitconfig"
GIT_TRANSLATION_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
GIT_TRANSLATION_CONFIG_FILE="$GIT_TRANSLATION_DIR/git_translation_aliases"

if grep -Fq "git-translation" "$GIT_CONFIG"
then
  # code if found
  echo "Translation is already installed, exiting"
  exit;
fi

echo $GIT_TRANSLATION_DIR

cat <<EOF >> $GIT_CONFIG
# the following include was inserted by git-translation project
[include]
	path = $GIT_TRANSLATION_CONFIG_FILE
EOF
