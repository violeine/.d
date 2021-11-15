XDG_CONFIG_HOME="$HOME/.config"
export XDG_CONFIG_HOME
export QT_QPA_PLATFORMTHEME="qt5ct"
#if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
#  exec startx
#fi
#
if (( $+commands[luarocks] )); then
    eval `luarocks path --bin`
fi
export QT_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export GTK_IM_MODULE=ibus

