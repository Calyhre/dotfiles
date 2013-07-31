ZSH=$HOME/.oh-my-zsh
ZSH_THEME="miloshadzic"
EDITOR="subl -w"
COMPLETION_WAITING_DOTS="true"

plugins=(git rails3)

source $ZSH/oh-my-zsh.sh

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# LOAD ALL ALIASES
if [ -f ~/.zsh_aliases ]; then
   source ~/.zsh_aliases
fi

export PATH="/usr/local/heroku/bin:$PATH"
export PATH="/usr/local/lib/node:$PATH"
export PATH="/usr/local/share/npm/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="/Applications/Postgres.app/Contents/MacOS/bin:$PATH"

eval "$(rbenv init -)"

# Change dir
if [ -d ~/Developer/ ]; then
 cd ~/Developer/
fi
