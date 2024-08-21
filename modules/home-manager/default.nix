{
  home-manager,
  pkgs,
  config,
  inputs,
  ...
}: {
  # Let home-manager manage itself
  programs.home-manager.enable = true;

  home.stateVersion = "24.05";

  home.preferXdgDirectories = true;

  # Don't print "Last login" header
  home.file.".hushlogin".text = "";

  home.file.".zshrc.d".source = ./dotfiles/zshrc.d;

  home.sessionPath = [
    "$HOME/bin"
  ];

  home.shellAliases = {
    ls = "ls -F";
    vim = "nvim";

    nixswitch = "darwin-rebuild switch --flake ~/nix-config";
    nixupdate = "nix flake update ~/nix-config && nixswitch";
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    CLICOLOR = 1;
  };

  home.packages = [
    # FIXME figure out how to pass `system` here
    inputs.nvim-af.packages.aarch64-darwin.default
  ];

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autocd = true;
    cdpath = ["$HOME/code"];

    history = {
      ignoreDups = true;
      ignoreSpace = true;
      size = 100000;
      save = 100000;
      ignorePatterns = ["exit" "clear" "ls" "fg" "bg"];
    };

    initExtraFirst = ''
      if [ -d "$HOME/.zshrc.d" ]; then
        for file in $HOME/.zshrc.d/*.zsh; do
          source "$file"
        done
      fi
    '';

    initExtra = ''
      . ${pkgs.asdf-vm}/share/asdf-vm/asdf.sh

      if [ -e "$HOME/.localrc" ]; then
        source $HOME/.localrc
      fi
    '';
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.ripgrep = {
    enable = true;
    arguments = ["--hidden" "--smart-case" "--glob=!.{git,jj}/*"];
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

      graph = "log --graph --oneline --format=jjish";
      mine = "! git log --author=$(git config --get user.email)";
    };

    includes = [
      {
        condition = "hasconfig:remote.*.url:git@github.com:seenons/**";
        contents = {
          user.email = "alejandro@seenons.com";
        };
      }
    ];

    extraConfig = {
      branch = {
        autoSetupRebase = "always";
      };

      checkout = {
        defaultRemote = "origin";
      };

      commit = {
        verbose = true;
      };

      diff = {
        algorithm = "histogram";
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

      pretty = {
        jjish = "%C(auto,brightmagenta)%h%C(reset) %C(auto,yellow)%an%C(reset) %C(auto,cyan)%ad%C(reset) %C(auto,magenta)%D%C(reset)%n%s";
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

  programs.jujutsu = {
    enable = true;
    settings = {
      user = {
        name = "Alejandro Fernández Gómez";
        email = "antarticonorte@gmail.com";
      };

      ui = {
        default-command = "log";
        diff-editor = ":builtin";
        diff.tool = "difft";
      };

      merge-tools.difft = {
        diff-args = ["--color=always" "$left" "$right"];
      };
    };
  };
}
