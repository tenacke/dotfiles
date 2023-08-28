# Dotfiles
tenacke's dotfiles for MacOs setup. This repository is inspired from [Mathias's Dotfiles](https://github.com/mathiasbynens/dotfiles). You can install and give it a try but it is suggested that you should fork this repository to edit settings with your own custom things.

## Extra Settings without a fork
You can create a '~/.extra' file and add your own extra variables and settings without forking the repository

## Installation
You can run the bootstrap.sh script and make script do the thing. Type this command

```
/bin/bash -c $(curl -fsSL (https://raw.githubusercontent.com/tenacke/dotfiles/main/bootstrap.sh)
```

## More
User spesific settings does not exist in this dotfiles. You can add your user spesific commands to bootstrap.sh file.

```
git config --global user.name 'tenacke'
git config --global user.email 'tenacke@example.com'
```
