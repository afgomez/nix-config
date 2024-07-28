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

  programs.git = {
    enable = true;
    
    userEmail = "antarticonorte@gmail.com";
    userName = "Alejandro Fernández Gómez";

    ignores = [
      # MacOS
      ".DS_Store"
      "._*"

      # Editors
      "*~"
      "*.swp"
      ".nova"
      ".zed"
      ".vscode"
    ];

    aliases = {
      co = "checkout";
      st = "status";

      ci = "commit"; 
      amend = "commit --amend";

      graph = "log --graph --oneline";
      mine = ''!"git log --author=$(git config --get user.email)"'';
    };

    extraConfig = {
      branch = {
        autoSetupRebase = true;
      };

      checkout = {
        defaultRemote = "origin";
      };

      commit = {
        verbose = true;
      };
      
      diff = {
        algorithm = "historgram";
      };

      grep = {
        lineNumber = true;
      };

      help = {
        autoCorrect = 1;
      };

      init = {
        defaultBranch = "main";
      };

      pull = {
        rebase = true;
      };

      push = {
        autoSetupRemote = true;
      };

      rebase = {
        autoSquash = true;
        autoStash = true;
        updateRefs = true;
      };
    };

    difftastic = {
      enable = true;
      background = "dark";
    };
  };
}
