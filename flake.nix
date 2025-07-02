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
          ./configuration.nix
        ];
        specialArgs = {
          inherit inputs;
          inherit pkgsStable;
        };
      };
    };
    homeConfigurations = {
      colin = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./home.nix
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
      sarah = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./home.nix
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
    nixpkgsStable.url = "nixpkgs/nixos-25.05";
    nix-gaming.url = "github:fufexan/nix-gaming";
    nixvim-config.url = "github:colinslegacy/nixvim-config";
    nixcord.url = "github:kaylorben/nixcord";
  };

}
