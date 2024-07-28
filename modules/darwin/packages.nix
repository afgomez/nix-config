{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [ 
    # CLI
    bat
    difftastic
    fd
    fzf
    gh
    git
    jq
    jujutsu
    less
    neovim
    ripgrep
    tlrc
    tokei
    tree
    vim
    zoxide
  ];
}
