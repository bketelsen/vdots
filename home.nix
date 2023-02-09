{pkgs, ...}: {
    home.username = "bjk";
    home.homeDirectory = "/home/bjk";
    home.packages = [
        pkgs.nixfmt
	    pkgs.neovim
        pkgs.cowsay
        pkgs.fzf
        pkgs.lazygit
        pkgs.ripgrep
        pkgs.jq
    ];
    programs.bash.enable = true;
    programs.bash.profileExtra = ". /home/bjk/.nix-profile/etc/profile.d/nix.sh";
    programs.direnv.enable = true;
    programs.starship.enable = true;
    services.syncthing.enable = true;
    home.stateVersion = "22.11"; # To figure this out (in-case it changes) you can comment out the line and see what version it expected.
    programs.home-manager.enable = true;
}
