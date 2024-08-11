{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # CLI
    asdf-vm
    bat
    difftastic
    exercism
    fd
    fzf
    gh
    git
    jq
    jujutsu
    less
    ripgrep
    rm-improved
    rustup
    tealdeer
    tokei
    tree
    zoxide
  ];
}
