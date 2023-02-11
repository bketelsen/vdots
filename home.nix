{pkgs, misc,...}: {
    home.username = "bjk";
    home.homeDirectory = "/home/bjk";
    home.packages = [
        pkgs.nixfmt
	    pkgs.neovim
        pkgs.fzf
        pkgs.lazygit
        pkgs.ripgrep
        pkgs.jq
        pkgs.dive
        pkgs.blackbox-terminal
    ];
    programs.bash = {
        enable = true;
        profileExtra = ". /home/bjk/.nix-profile/etc/profile.d/nix.sh";
        enableCompletion = true;
        enableVteIntegration = true;
    };
    programs.direnv.enable = true;
    programs.starship.enable = true;
    programs.atuin.enable = true;
    programs.fzf.enable = true;
    programs.gh.enable = true;
    programs.git = {
        enable = true;
        userEmail = "bketelsen@gmail.com";
        userName = "Brian Ketelsen";
    };
    programs.zellij = {
        enable = true;
    };
    dconf.enable = true;
    services.syncthing.enable = true;
    home.shellAliases = {
      npu = "export NIXPKGS_ALLOW_UNFREE=1; nix profile upgrade --impure '.*'";
      hmh = "home-manager-help";
    };
    home.sessionPath = [
        "$HOME/bin"
        "$HOME/.local/bin"
    ];
    gtk.theme= {
        name = "Adwaita";
        package = "pkgs.gnome.gnome-themes-extra";
    };
    gtk.iconTheme = {
        package = "pkgs.gnome.adwaita-icon-theme";
        name = "Adwaita";
    };
    fonts.fontconfig.enable = true;
    manual.html.enable = true;
    home.stateVersion = "22.11"; # To figure this out (in-case it changes) you can comment out the line and see what version it expected.
    programs.home-manager.enable = true;
}
