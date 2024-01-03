{
  description = "Matt's Flake for Nix-Darwin";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nix-doom-emacs.url = "github:nix-community/nix-doom-emacs";
    nixneovimplugins.url = "github:jooooscha/nixpkgs-vim-extra-plugins";
  };

  outputs =
    inputs@{ self, nix-darwin, nixpkgs, home-manager, nix-doom-emacs, ... }:
    let
      user = "msp";
      nixpkgs.overlays = [ inputs.nixneovimplugins.overlays.default ];
    in {
      # Build darwin flake using:
      # $ darwin-rebuild build --flake .#simple
      darwinConfigurations."Matthews-MacBook-Air" =
        nix-darwin.lib.darwinSystem {
          specialArgs = { inherit user; };
          modules = [
            home-manager.darwinModules.home-manager
            {
              nixpkgs = nixpkgs;
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                users.${user}.imports =
                  [ ./modules/home-manager nix-doom-emacs.hmModule ];
              };
            }
            ./modules/dock
            {
              local.dock = (import ./modules/dock/config.nix { user = user; });
            }
            ./modules/darwin
          ];
        };

      darwinConfigurations."Matthews-Mac-Studio" = nix-darwin.lib.darwinSystem {
        specialArgs = { inherit user; };
        modules = [
          home-manager.darwinModules.home-manager
          {
            nixpkgs = nixpkgs;
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.${user}.imports =
                [ ./modules/home-manager nix-doom-emacs.hmModule ];
            };
          }
          ./modules/dock
          { local.dock = (import ./modules/dock/config.nix { user = user; }); }
          ./modules/darwin
        ];
      };

      # Expose the package set, including overlays, for convenience.
      darwinPackages = self.darwinConfigurations."Matthews-Mac-Studio".pkgs;
    };
}
