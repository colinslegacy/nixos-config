{

  description = "legacy flake";

  outputs = { self, nixpkgs, home-manager, nixpkgsStable, ... }@inputs:
    let
      system = "x86_64-linux";

      username = "colin";
      browser = "firefox";
      editor = "nvim";
      term = "alacritty";

      lib = nixpkgs.lib;
      pkgs = nixpkgs.legacyPackages.${system};
      pkgsStable = import nixpkgsStable { system = system; config = { allowUnfree = true; }; };
    in {
    nixosConfigurations = {
      legacy = lib.nixosSystem {
        inherit system;
        modules = [
          ./profiles/desktop/configuration.nix
        ];
        specialArgs = {
          inherit inputs;
          inherit pkgsStable;
        };
      };
    };
    homeConfigurations = {
      "colin@legacy" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./profiles/desktop/home.nix
        ];
        extraSpecialArgs = {
          inherit username;
          inherit browser;
          inherit system;
          inherit editor;
          inherit term;
          inherit pkgsStable;
          inherit inputs;
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
    hyprland.url = "github:hyprwm/Hyprland";
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
