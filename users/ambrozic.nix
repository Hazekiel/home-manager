{ config, pkgs, ... }:

{
  imports = [
    ./../home-modules/lf/lf.nix
    ./../stylix/stylix.nix
  ];

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "ambrozic";
  home.homeDirectory = "/home/ambrozic";

  nixpkgs.config.allowUnfree = true;
  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    vscode
    nixfmt
    fastfetch
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  home.shellAliases = {
    rebuild = "git -C /etc/nixos pull; nh os switch";
    rebuild_boot = "git -C /etc/nixos pull; nh os boot";
    cleanup = "nh clean all --keep 3; nix store optimise -v";
  };

  programs = {
    git = {
      enable = true;
      settings = {
        user.name = "Hazekiel";
        user.email = "239578063+Hazekiel@users.noreply.github.com";
      };
    };

    zsh = {
      enable = true;
      initExtra = ''
        export PATH=$PATH:${config.home.homeDirectory}/scripts
        fastfetch
      '';
    };
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/ambrozicquentin/etc/profile.d/hm-session-vars.sh
  #
  #home.sessionVariables = {
  # EDITOR = "emacs";
  #};

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
