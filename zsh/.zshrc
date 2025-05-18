# ~/.zshrc
autoload -Uz add-zsh-hook
autoload -Uz vcs_info
autoload -Uz compinit && compinit
autoload -U bashcompinit && bashcompinit

add-zsh-hook -Uz zsh_directory_name zsh_directory_name_cdr

zstyle ':vcs_info:*' enable git svn
zstyle ':vcs_info:*' actionformats '%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
zstyle ':vcs_info:*' formats '%F{5}[%F{2}%b%F{5}]%f '
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'
zstyle ':completion:*' completer _complete _ignored _approximate
zstyle :compinstall filename '/home/zdk/.zshrc'

setopt auto_param_slash
setopt beep extendedglob
setopt prompt_subst

HISTSIZE=1000
SAVEHIST=1000
HISTFILE="$XDG_CACHE_HOME/zsh_history"
HISTCONTROL=ignoreboth

bindkey -e

# eval "$(register-python-argcomplete portmod)"

# End of file

# Load oh-my-zsh
#source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
#source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# source $HOME/.oh-my-zsh/oh-my-zsh.sh

source $HOME/zsh/env.zsh
source $HOME/zsh/path.zsh
source $HOME/zsh/aliases.zsh

if command -v starship > /dev/null; then 
  eval "$(starship init zsh)"
else
  precmd () { 
    vcs_info 
  }

  PROMPT='%F{5}[%F{4}%n%f@%F{1}%m%F{5}] %F{3}%3~ ${vcs_info_msg_0_}%f$ '
fi

if command -v brew > /dev/null; then
  if [[ $(uname) == "Linux" ]]; then
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
  fi
fi

if command -v zellij > /dev/null; then
  source $HOME/zsh/zellij.zsh
fi
