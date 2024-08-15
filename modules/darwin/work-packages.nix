{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    lokalise2-cli
  ];
}
