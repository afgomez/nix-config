{ pkgs, ... }: {
  # Let home-manager manage itself
  programs.home-manager.enable = true;
  
  home.stateVersion = "24.05"; 

  
  programs.zsh = {
    enable = true;
  };
}
