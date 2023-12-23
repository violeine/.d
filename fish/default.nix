{pkgs, ...} : {
  home.packages = with pkgs; [
    eza
    fzf
    ripgrep
    bat
    zoxide
    lazygit
    git
    hledger
  ];
  home.file.".config/fish" = {
    source = ./.;
    recursive = true;
  };
  programs.fish.enable = true;
}
