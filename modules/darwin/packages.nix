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
    ripgrep
    tlrc
    tokei
    tree
    zoxide
  ];
}
