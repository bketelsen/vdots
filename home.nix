{ pkgs, misc, ... }: {
  nixpkgs = {
    # You can add overlays here
    overlays = [
      # If you want to use overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = (_: true);
    };
  };
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
    pkgs.htop
    pkgs.yq
    pkgs.vscode
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
  programs.zellij = { enable = true; };
  dconf.enable = true;
  services.syncthing.enable = true;
  home.shellAliases = {
    npu = "export NIXPKGS_ALLOW_UNFREE=1; nix profile upgrade --impure '.*'";
    hmh = "home-manager-help";
    vdots = "cd ~/vdots";
    vblue = "cd ~/projects/vanillaos/vblue";
  };
  home.sessionPath = [ "$HOME/bin" "$HOME/.local/bin" ];
  gtk.theme = {
    name = "Adwaita";
    package = "pkgs.gnome.gnome-themes-extra";
  };
  gtk.iconTheme = {
    package = "pkgs.gnome.adwaita-icon-theme";
    name = "Adwaita";
  };
  fonts.fontconfig.enable = true;
  home.stateVersion =
    "22.11"; # To figure this out (in-case it changes) you can comment out the line and see what version it expected.
  programs.home-manager.enable = true;
}
