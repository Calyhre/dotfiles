LC_ALL=en_US.UTF-8
LANG=en_US.UTF-8
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="miloshadzic"
DUMPS_FOLDER=$HOME/Developer/dumps

DOTFILES=$HOME/.homesick/repos/dotfiles/home
ATOMFILES=$HOME/.atom
SCRIPTS=$HOME/.scripts
EDITOR="/usr/local/bin/atom"

COMPLETION_WAITING_DOTS="true"

autoload -U zmv

setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history

plugins=(git rails rake-fast zsh-syntax-highlighting history-substring-search)

source $ZSH/oh-my-zsh.sh

# LOAD ALL ALIASES
[ -f ~/.zsh_aliases ] && source ~/.zsh_aliases
# iTerm 2 integration
[ -f ~/.iterm2_shell_integration.zsh ] && source ~/.iterm2_shell_integration.zsh
# LOAD TRAVIS
[ -f ~/.travis/travis.sh ] && source ~/.travis/travis.sh

# Google Cloud SDK.
[ -f ~/Developer/google-cloud-sdk/path.zsh.inc ] && source ~/Developer/google-cloud-sdk/path.zsh.inc
[ -f ~/Developer/google-cloud-sdk/completion.zsh.inc ] && source ~/Developer/google-cloud-sdk/completion.zsh.inc

# Autojump <3
# [[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH="/usr/local/heroku/bin:$PATH"
export PATH="/usr/local/lib/node:$PATH"
export PATH="/usr/local/share/npm/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.cabal/bin:$PATH"
export PATH="$HOME/.cabal/bin:$PATH"
export PATH="/Applications/Postgres.app/Contents/MacOS/bin:$PATH"

eval "$(rbenv init - --no-rehash)"
eval "$(hub alias -s)"
source $(brew --prefix nvm)/nvm.sh

export GOPATH="$HOME/.go"
export GOROOT="/usr/local/opt/go/libexec"
export PATH="$PATH:$GOPATH/bin"
export PATH="$PATH:$GOROOT/bin"

export NVM_DIR="$HOME/.nvm"

export PATH="$SCRIPTS:$PATH"
export PATH="node_modules/.bin:$PATH"
export PATH=".bin:$PATH"
export PATH="bin:$PATH"
export PATH="$HOME/Library/Android/sdk/tools:$PATH"
export PATH="$HOME/Library/Android/sdk/build-tools:$PATH"
export PATH="$HOME/Library/Android/sdk/platform-tools:$PATH"


# Change dir
if [ -f ~/.RELOAD ]; then
  cd $(cat ~/.RELOAD)
  rm ~/.RELOAD
elif [ -f ~/.WORK_ON ]; then
  cd $(cat ~/.WORK_ON)
elif [ -d ~/Developer/ ]; then
  cd ~/Developer/
fi

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

autoload -U add-zsh-hook
load-nvmrc() {
  if [[ -f .nvmrc && -r .nvmrc ]]; then
    nvm use
  elif [[ $(nvm version) != $(nvm version default)  ]]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc
