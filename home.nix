{pkgs, ...}: {
    home.username = "bjk";
    home.homeDirectory = "/home/bjk";
    home.packages = [
        pkgs.nixfmt
        pkgs.cowsay
        pkgs.fzf
        pkgs.lazygit
        pkgs.ripgrep
    ];
    home.stateVersion = "22.11"; # To figure this out (in-case it changes) you can comment out the line and see what version it expected.
    programs.home-manager.enable = true;
}
