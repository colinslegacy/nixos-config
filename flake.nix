{

  description = "legacy flake";

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      nixpkgsStable,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      lib = nixpkgs.lib;
      pkgs = nixpkgs.legacyPackages.${system};
      pkgsStable = import nixpkgsStable {
        system = system;
        config = {
          allowUnfree = true;
        };
      };
    in
    {
      nixosConfigurations = {
        legacy = lib.nixosSystem {
          inherit system;
          modules = [
            ./hosts/desktop/configuration.nix
          ];
          specialArgs = {
            inherit inputs;
            inherit pkgsStable;
          };
        };
        laptop = lib.nixosSystem {
          inherit system;
          modules = [
            ./hosts/laptop/configuration.nix
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
            ./modules/user/home.nix
          ];
          extraSpecialArgs = {
            inherit system;
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
    nixpkgsStable.url = "nixpkgs/nixos-25.11";
    nix-gaming.url = "github:fufexan/nix-gaming";
    nixvim-config.url = "github:colinslegacy/nixvim-config";
    nixcord.url = "github:kaylorben/nixcord";
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };
    nur.url = "github:nix-community/nur";
  };
}
