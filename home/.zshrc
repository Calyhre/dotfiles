ZSH=$HOME/.oh-my-zsh
ZSH_THEME="miloshadzic"
DUMPS_FOLDER=$HOME/Developer/dumps

DOTFILES=$HOME/.homesick/repos/dotfiles/home
ATOMFILES=$HOME/.atom
SCRIPTS=$HOME/.scripts
EDITOR="atom"

COMPLETION_WAITING_DOTS="true"

plugins=(git rails rake-fast zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# LOAD ALL ALIASES
[ -f ~/.zsh_aliases ] && source ~/.zsh_aliases
# LOAD TRAVIS
[ -f ~/.travis/travis.sh ] && source ~/.travis/travis.sh

export PATH="/usr/local/heroku/bin:$PATH"
export PATH="/usr/local/lib/node:$PATH"
export PATH="/usr/local/share/npm/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.cabal/bin:$PATH"
export PATH="/Applications/Postgres.app/Contents/MacOS/bin:$PATH"
eval "$(rbenv init - --no-rehash)"

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
