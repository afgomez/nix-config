{ home-manager, pkgs, ... }: {
  # Let home-manager manage itself
  programs.home-manager.enable = true;
  
  home.stateVersion = "24.05"; 
  
  home.preferXdgDirectories = true;
  
  # Don't print "Last login" header 
  home.file.".hushlogin".text = "";

  home.sessionPath = [
    "$HOME/bin"
  ];
  
  home.shellAliases = {
    ls = "ls -F";
    vim = "nvim";
    
    nixswitch = "darwin-rebuild switch --flake ~/nix-config";
    nixup = "nix flake update ~/nix-config && nix-switch";
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    CLICOLOR = 1;
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autocd = true;
    cdpath = [ "$HOME/code" ];

    history = {
      ignoreDups = true;
      ignoreSpace = true;
      size = 100000;
      save = 100000;
      ignorePatterns = [ "exit" "clear" "ls" "fg" "bg" ];
    };

    initExtra = ''
    if [ -e "$HOME/.localrc" ]; then
      source $HOME/.localrc
    fi
    '';
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };
}
