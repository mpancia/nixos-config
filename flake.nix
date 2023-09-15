{
  description = "Matt's Flake for Nix-Darwin";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager, ... }:
    let
      user = "msp";
      configuration = { pkgs, ... }: { };
    in
    {
      # Build darwin flake using:
      # $ darwin-rebuild build --flake .#simple
      darwinConfigurations."Matthews-MacBook-Air" = nix-darwin.lib.darwinSystem {
        specialArgs = { inherit user; };
        modules = [
          configuration
          home-manager.darwinModules.home-manager
          {
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

      # Expose the package set, including overlays, for convenience.
      darwinPackages = self.darwinConfigurations."Matthews-MacBook-Air".pkgs;
    };
}
