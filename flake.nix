{
  description = "nix-darwin configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs }: {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#Magrathea-II
    darwinConfigurations."Magrathea-II" = nix-darwin.lib.darwinSystem {
      modules = [
        ./modules/darwin
      ];
    };

    # Expose the package set, including overlays, for convenience.
    darwinPackages = self.darwinConfigurations."Magrathea-II".pkgs;
  };
}
