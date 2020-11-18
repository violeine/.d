#path
export PATH=$HOME/.cargo/bin:$HOME/.local/bin:$HOME/.script:$HOME/.node_modules/bin:$HOME/.config/composer/vendor/bin:$PATH
export npm_config_prefix=~/.node_modules
#set editor to nvim
export EDITOR=nvim
#use fzf and rg for better experience
export FZF_DEFAULT_COMMAND='rg --files --hidden'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND='rg --hidden --files --sort-files --null 2> /dev/null | xargs -0 dirname | uniq'

#android forg
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$HOME/.emacs.d/bin:$PATH
