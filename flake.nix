{
  description = "nix-darwin configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nvim-af.url = "github:afgomez/nvim-af";
    nvim-af.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs @ {
    self,
    nix-darwin,
    home-manager,
    ...
  }: {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#Magrathea-II
    darwinConfigurations."Magrathea-II" = nix-darwin.lib.darwinSystem {
      modules = [
        ./modules/darwin
        home-manager.darwinModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.afgomez.imports = [./modules/home-manager];
            extraSpecialArgs = {inherit inputs;};
          };
        }
      ];
    };

    # Expose the package set, including overlays, for convenience.
    darwinPackages = self.darwinConfigurations."Magrathea-II".pkgs;
  };
}
