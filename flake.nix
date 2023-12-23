{
  description = "Home Manager configuration of violeine";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }: {

      defaultPackage.aarch64-darwin = home-manager.defaultPackage.aarch64-darwin;
      defaultPackage.x86_64-linux = home-manager.defaultPackage.x86_64-linux;
      homeConfigurations = {
        "violeine@regret" = home-manager.lib.homeManagerConfiguration {

          # Specify your home configuration modules here, for example,
          # the path to your home.nix.
          modules = [ ./home.nix
          {
            home.username = "violeine";
            home.homeDirectory = "/Users/violeine";
          }
          ];
          pkgs = nixpkgs.legacyPackages.aarch64-darwin;

          # Optionally use extraSpecialArgs
          # to pass through arguments to home.nix
        };
        "violeine@deck" = home-manager.lib.homeManagerConfiguration {

          # Specify your home configuration modules here, for example,
          # the path to your home.nix.
          modules = [ ./home.nix 
          {
            home.username = "violeine";
            home.homeDirectory = "/var/home/violeine";
          }
          ];
          pkgs = nixpkgs.legacyPackages.x86_64-linux;

          # Optionally use extraSpecialArgs
          # to pass through arguments to home.nix
        };
      };
    };
    }
