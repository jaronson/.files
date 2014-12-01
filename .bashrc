unset LD_LIBRARY_PATH
unset DYLD_LIBRARY_PATH
unset color_prompt force_color_prompt

export MANPATH=/opt/local/share/man:$MANPATH
export ARCHFLAGS='-arch x86_64'
export VISUAL=vim
export EDITOR="$VISUAL"
export LESS="FRX"
export RI="--format ansi -T"
export PSQL_EDITOR='vim -c"set syntax=sql"'
export CLICOLOR=1
export LSCOLORS=exfxcxdxbxexexabagacad
export HISTSIZE=10000         # Store 10,000 history entries
export HISTCONTROL=erasedups  # Don't store duplicates
export PYTHONPATH=/usr/local/lib/python2.7/site-packages:$PYTHONPATH
export WORKON_HOME=$HOME/Envs

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

PATH=/usr/local/bin:$PATH
PATH=/usr/local/sbin:$PATH
PATH=$HOME/.rvm/bin:$PATH     # Add RVM to PATH for scripting
PATH=/usr/local/share/npm/bin:$PATH
PATH=$HOME/.bin:$PATH
export PATH

RED="\[\033[0;31m\]"
YELLOW="\[\033[1;33m\]"
GREEN="\[\033[0;32m\]"
BLUE="\[\033[0;34m\]"
BLACK="\[\033[0m\]"

function parse_git_deleted {
  [[ $(git status 2> /dev/null | grep deleted:) != "" ]] && echo "-"
}

function parse_git_added {
  [[ $(git status 2> /dev/null | grep "Untracked files:") != "" ]] && echo ' +'
}

function parse_git_modified {
  [[ $(git status 2> /dev/null | grep modified:) != "" ]] && echo "*"
}

function parse_git_dirty {
  echo "$(parse_git_added)$(parse_git_modified)$(parse_git_deleted)"
}

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1]/"
}

function prompt_command {
  export PS1="$GREEN\u@\h$BLUE:\w $RED$(parse_git_branch)$BLACK$ "
}

export PROMPT_COMMAND=prompt_command

# Append to history file
shopt -s histappend

bind 'set bind-tty-special-chars off'
bind '"\ep": history-search-backward'
bind '"\en": history-search-forward'
bind '"\C-w": backward-kill-word'

# Aliases
alias l="ls -lah"
alias ll="ls -lh"
alias sqlite='sqlite3'
alias top='top -FRo rprvt'

source $HOME/.rvm/scripts/rvm
source $HOME/.files/git-completion.bash
source $HOME/.files/.complete-hosts.sh
