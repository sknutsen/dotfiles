# ~/.zshrc
autoload -Uz add-zsh-hook
autoload -Uz vcs_info
add-zsh-hook -Uz zsh_directory_name zsh_directory_name_cdr
zstyle ':vcs_info:*' enable git svn
zstyle ':vcs_info:*' actionformats '%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
zstyle ':vcs_info:*' formats '%F{5}[%F{2}%b%F{5}]%f '
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'

# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored _approximate
zstyle :compinstall filename '/home/zdk/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt beep extendedglob
bindkey -e
# End of lines configured by zsh-newuser-install

autoload -U bashcompinit
bashcompinit

eval "$(register-python-argcomplete portmod)"

# End of file

# Load oh-my-zsh
#source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
#source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# source $HOME/.oh-my-zsh/oh-my-zsh.sh

source $HOME/zsh/env.zsh
source $HOME/zsh/path.zsh
source $HOME/zsh/aliases.zsh

precmd () { 
    vcs_info 
}

setopt prompt_subst
PROMPT='%F{5}[%F{4}%n%f@%F{1}%m%F{5}] %F{3}%3~ ${vcs_info_msg_0_}%f$ '
eval "$(starship init zsh)"

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

source $HOME/zsh/zellij.zsh
