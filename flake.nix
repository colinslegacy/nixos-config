{

  description = "legacy flake";

  outputs = { self, nixpkgs, home-manager, nixpkgsStable, nix-gaming, hyprland, split-monitor-workspaces, hyprland-plugins, ... }@inputs:
    let
      system = "x86_64-linux";
      hostname = "legacy";
      profile = "legacy";
      timezone = "America/New_York";
      locale = "en_US.UTF-8";
      allowUnfree = true;

      username = "colin";
      name = "Colin";
      email = "colin@colinslegacy.com";
      wm = "hyprland";
      browser = "librewolf";
      editor = "nvim";
      term = "alacritty";

      lib = nixpkgs.lib;
      pkgs = nixpkgs.legacyPackages.${system};
      pkgsStable = import nixpkgsStable { system = system; config = { allowUnfree = true; }; };
    in {
    nixosConfigurations = {
      legacy = lib.nixosSystem {
        inherit system;
        modules = [ (./. + "/profiles"+("/"+profile)+"/configuration.nix") ];
        specialArgs = {
          inherit inputs;
          inherit hostname;
          inherit timezone;
          inherit locale;
          inherit wm;
          inherit allowUnfree;
          inherit pkgsStable;
        };
      };
    };
    homeConfigurations = {
      colin = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          (./. + "/profiles"+("/"+profile)+"/home.nix")
        ];
        extraSpecialArgs = {
          inherit username;
          inherit name;
          inherit email;
          inherit browser;
          inherit system;
          inherit editor;
          inherit term;
          inherit allowUnfree;
          inherit pkgsStable;
          inherit (inputs) nix-gaming;
          inherit hyprland;
          inherit split-monitor-workspaces;
          inherit hyprland-plugins;
          inherit (inputs) nixvim-config;
        };
      };
    };
  };

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nixpkgsStable.url = "nixpkgs/nixos-24.05";
    nix-gaming.url = "github:fufexan/nix-gaming";
    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    split-monitor-workspaces = {
      url = "github:Duckonaut/split-monitor-workspaces";
      inputs.hyprland.follows = "hyprland"; # <- make sure this line is present for the plugin to work as intended
    };
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
    nixvim-config.url = "github:colinslegacy/nixvim-config";
  };

}
