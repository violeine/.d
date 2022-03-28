### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

export PATH="$PATH:$HOME/.script"
typeset -g HISTSIZE=290000 SAVEHIST=290000 HISTFILE=~/.zsh_history
setopt HIST_SAVE_NO_DUPS # Do not write a duplicate event to the history file.
setopt AUTO_CD
setopt EXTENDED_GLOB
setopt inc_append_history
setopt share_history
setopt extended_history
stty stop undef		# Disable ctrl-s to freeze terminal.
unsetopt nomatch # disable annoying unmatch stuff
# Load a few important annexes, without Turbo
# (this is currently required for annexes)
# zinit light-mode for \
#     zinit-zsh/z-a-rust \
#     zinit-zsh/z-a-as-monitor \
#     zinit-zsh/z-a-patch-dl \
#     zinit-zsh/z-a-bin-gem-node

### End of Zinit's installer chunk

zinit ice compile'(pure|async).zsh' pick'async.zsh' src'pure.zsh'
zinit light sindresorhus/pure
export ZSH_BASE="/bin/fzf/"


#alias
source $HOME/.zsh/alias.zsh
bindkey -e #shell with emacs is easier
autoload -Uz compinit
compinit

eval "$(zoxide init zsh)"

# if [[ $DISPLAY ]]; then
# 	[[ $- != *i* ]] && return
# 	[[ -z "$TMUX" ]] && tat
# fi

zinit snippet OMZ::plugins/sudo/sudo.plugin.zsh
zinit snippet OMZ::plugins/fzf/fzf.plugin.zsh

# if ! pgrep -u "$USER" ssh-agent > /dev/null; then
#     eval "$(ssh-agent -s)"
#     ssh-add ~/.ssh/id_rsa
# fi

#if [[ ! "$SSH_AUTH_SOCK" ]]; then
#    source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
#fi
# cat ~/.config/palette

# export NVM_DIR="$HOME/.config/nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# # place this after nvm initialization!
# autoload -U add-zsh-hook
# load-nvmrc() {
#   local node_version="$(nvm version)"
#   local nvmrc_path="$(nvm_find_nvmrc)"

#   if [ -n "$nvmrc_path" ]; then
#     local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

#     if [ "$nvmrc_node_version" = "N/A" ]; then
#       nvm install
#     elif [ "$nvmrc_node_version" != "$node_version" ]; then
#       nvm use
#     fi
#   elif [ "$node_version" != "$(nvm version default)" ]; then
#     echo "Reverting to nvm default version"
#     nvm use default
#   fi
# }
# add-zsh-hook chpwd load-nvmrc
# load-nvmrc
