{pkgs, ...}: {
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
    nodejs_20
    ripgrep
    tealdeer
    tokei
    tree
    zoxide
  ];
}
