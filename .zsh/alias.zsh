ali="$HOME/.zsh/alias.zsh"
alias d='/usr/bin/git --git-dir=$HOME/.dot.git/ --work-tree=$HOME'
alias dotsub='dot submodule '
alias dota='dot add -u ~'
alias dotst='dot status'
alias dotcm='dot commit -am'
alias dotpu='dot push'
alias dotpl='dot pull'
alias pacin='pacman -Slq | fzf -m --preview '\''pacman -Si {1}'\'' | xargs -ro sudo pacman -S'
alias yayin='yay -Slq | fzf -m --preview '\''yay -Si {1}'\'' | xargs -ro yay -S'
alias vim=nvim
alias vimdiff=nvim -d
alias vi=/usr/bin/vim
alias viconf='nvim -S ~/.config/Session.vim'
alias startd='sudo systemctl start'
alias restartd='sudo systemctl restart'
alias enabled='sudo systemctl enable'
alias statusd='sudo systemctl status'
alias stopd='sudo systemctl stop'
alias serve='php artisan serve --host=0.0.0.0 --port=8000'
alias sicp='racket -l sicp -i'
alias lsa='ls -lah'
alias l='ls -lah'
alias la='ls -lAh'
alias ll='ls -lh'
alias dl='lazygit --git-dir=$HOME/.dot.git/ --work-tree=$HOME'
#chicken

alias csi='chicken-csi'
alias csc='chicken-csc'


