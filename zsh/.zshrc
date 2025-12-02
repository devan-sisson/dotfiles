# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
#

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

export VISUAL="nvim"
export EDITOR=$VISUAL

# Ensure envman(webi installed env vars) loads before alias and functions
# There was an issue where go was not being found in the alias to add the go path bin to path
 
# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

# Loads envman env vars
source ~/.config/envman/PATH.env

# Load vte for tilix
# if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
#         source /etc/profile.d/vte.sh
# fi

######################################################

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="othello"

plugins=(git)

source $ZSH/oh-my-zsh.sh

function zshsrc()
{
  source $HOME/.zshrc
  echo "refreshed zsh source"
}

function opencode() 
{
  if command -v code $> /dev/null
    then
      for i in "$@"
      do
        code "$i"
      done
    else
      echo "vscode not installed"
  fi
}

#function kubsecrets()
#{
#  kubectl get configmap $($1)-config -o yml | yq .data
#}

alias zshconfig="nvim ~/.zshrc"
alias zshless="less $HOME/.zshrc"

alias nvimconfig="nvim ~/.config/nvim"

alias gotest='GO_TEST_OUTPUT=$(go test -json -v -count=1 ./...); \
  echo "$GO_TEST_OUTPUT" | gotestfmt -hide empty-packages; \
  echo "$GO_TEST_OUTPUT" | tparse;
  '

alias gopretty="gofmt -w -s ."
alias dcomp="docker compose"
alias gotestsum="go run gotest.tools/gotestsum@latest --format testname"
# alias newproj="project-template-cli"




# alias phpunit="$HOME/bin/phpunit"
# alias composer="$HOME/bin/composer.phar"

# export DOTNET_ROOT=$HOME/dotnet
# export PATH=$PATH:$DOTNET_ROOT
# export PATH=$PATH:"$HOME/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
if [[ "$(uname)" = "Darwin" ]]; then
 	export ANDROID_HOME=$HOME/Library/Android/sdk
  # add CHROME_EXECUTABLE for macOS: https://stackoverflow.com/a/69205440
fi

if [[ "$(uname)" = "Linux" ]]; then
	export ANDROID_HOME=$HOME/Android/Sdk
  export CHROME_EXECUTABLE=/usr/bin/brave-browser
fi

export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$HOME/bin/flutter/bin
# export PATH=$PATH:$HOME/bin/phpunit
# export PATH=$PATH:$HOME/bin/composer
# export GOPATH=/usr/local/go/bin/go

export PATH=$PATH:$(go env GOPATH)/bin
export PATH=$PATH:$HOME/.cargo/bin
export PATH="$PATH":"$HOME/.pub-cache/bin"
export PATH=$PATH:$HOME/bin/exercism
export PATH=$PATH:$HOME/bin
export PATH=$PATH:$HOME/.local/share/mise/shims

# export PATH=PATH:$HOME/bin/nvim-linux-x86_64/bin
# setup go env vars to use company private dirs
#if command -v go &> /dev/null
#then
#  go env -w GOPROXY=direct
#  go env -w GOPRIVATE=$COMPANY_GIT
#fi
#


eval "$(~/.local/bin/mise activate)"
