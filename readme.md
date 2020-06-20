# git-translation

As a non-native english speaker, when someone learns the git commands they are
just words with primary meaning connected with git and programming. For those
people to hear those commands translated to their own language can sound quite
entertaining as at that moment they lose the connection to programming.

So this repo is here just for fun. You can install the alias to your git config
by:
1. clone the repo
2. run the `install.sh install` - this will insert an `include` section
3. start using git with the aliases

The include section will be something like this:
```
# the following include was inserted by git-translation project
[include]
  path = /home/user/Projects/git-translation/aliases/hu
```

To uninstall the translation you can either delete this from your git config
(`~/.gitconfig`) or can run `./install.sh remove`.

# Future plans

1. Add more translations
2. World domination
