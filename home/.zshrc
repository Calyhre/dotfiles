ZSH=$HOME/.oh-my-zsh
ZSH_THEME="miloshadzic"
DUMPS_FOLDER=$HOME/Developer/dumps

DOTFILES=$HOME/.homesick/repos/dotfiles/home
EDITOR="subl -w"

COMPLETION_WAITING_DOTS="true"

plugins=(git rails)

source $ZSH/oh-my-zsh.sh

# LOAD ALL ALIASES
if [ -f ~/.zsh_aliases ]; then
   source ~/.zsh_aliases
fi

export PATH="/usr/local/heroku/bin:$PATH"
export PATH="/usr/local/lib/node:$PATH"
export PATH="/usr/local/share/npm/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="/Applications/Postgres.app/Contents/MacOS/bin:$PATH"

eval "$(rbenv init - --no-rehash)"

# Change dir
if [ -f ~/.WORK_ON ]; then
  cd $(cat ~/.WORK_ON)
elif [ -f ~/.RELOAD ]; then
  cd $(cat ~/.RELOAD)
  rm ~/.RELOAD
elif [ -d ~/Developer/ ]; then
  cd ~/Developer/
fi
