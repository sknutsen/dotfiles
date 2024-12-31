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

export ZVM=$HOME/.zvm
export ZIG=$ZVM/bin
export ZVM_INSTALL=$ZVM/self

export TERM=alacritty
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:/home/zdk/.local/bin
export PATH=$PATH:/home/zdk/go/bin
export PATH=$PATH:/usr/local/lib/python3.11/site-packages/
export PATH=$PATH:/usr/local/lib/python3.11/site-packages/
export PATH=$PATH:$ZIG
export PATH=$PATH:$ZVM_INSTALL
export CLR_OPENSSL_VERSION_OVERRIDE=1.1
export LD_LIBRARY_PATH=

# End of file
#source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
#source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Aliases
alias code=codium
# alias go="/usr/local/go/bin/go"
alias omw="portmod openmw"
alias rundp="/home/zdk/Games/OpenMWMods/Tools/DeltaPlugin/rundp.sh"
alias tes3cmd="/home/zdk/Games/OpenMWMods/tes3cmd-0.37w"

precmd () { 
    vcs_info 
}

setopt prompt_subst
PROMPT='%F{5}[%F{4}%n%f@%F{1}%m%F{5}] %F{3}%3~ ${vcs_info_msg_0_}%f$ '
eval "$(starship init zsh)"

# Turso
export PATH="/home/zdk/.turso:$PATH"
