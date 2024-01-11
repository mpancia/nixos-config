{
  description = "Matt's Flake for Nix-Darwin";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nixneovimplugins.url = "github:jooooscha/nixpkgs-vim-extra-plugins";
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";

  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager, ... }:
    let
      user = "msp";
      nixpkgs.overlays = [
        inputs.nixneovimplugins.overlays.default
        inputs.neovim-nightly-overlay.overlay
      ];
    in {
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
                users.${user}.imports = [ ./modules/home-manager ];
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
              users.${user}.imports = [ ./modules/home-manager ];
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
