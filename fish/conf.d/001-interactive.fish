if status is-interactive
    fish_add_path ~/.config/bin
    fish_add_path ~/.local/share/nvim/mason/bin
    fish_add_path ~/.cargo/bin
    fish_add_path ~/.config/emacs/bin
    fish_add_path ~/.local/share/bin
    set -x TERMINFO_DIRS $HOME/.local/share/terminfo
    set -x LEDGER_FILE ~/notes/ledger.journal
end
