if status is-interactive
    # Commands to run in interactive sessions can go here
end

if status is-login
    eval "$(/opt/homebrew/bin/brew shellenv)"
    fish_add_path "$(brew --prefix)/opt/python/libexec/bin"
end

# tabtab source for packages
# uninstall by removing these lines
[ -f ~/.config/tabtab/fish/__tabtab.fish ]; and . ~/.config/tabtab/fish/__tabtab.fish; or true
