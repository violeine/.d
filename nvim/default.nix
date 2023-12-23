{pkgs, config, ...}:{
  home.packages = with pkgs; [
    neovim 
  ]; 
  home.file.".config/nvim" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.d/nvim";
    recursive = true;
  };
}
