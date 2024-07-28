{ pkgs, ... }: {
  imports = [
    ./core.nix
    ./packages.nix
    ./preferences.nix
  ];
}
