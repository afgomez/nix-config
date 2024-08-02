{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # CLI
    asdf-vm
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
    tealdeer
    tokei
    tree
    zoxide
  ];
}
