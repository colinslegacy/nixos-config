{

  description = "legacy flake";

  outputs = { self, nixpkgs, home-manager, nixpkgsStable, nix-doom-emacs, nix-gaming,  ... }@inputs:
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
      wm = "kde";
      browser = "librewolf";
      editor = "emacsclient";
      term = "alacritty";

      lib = nixpkgs.lib;
      pkgs = nixpkgs.legacyPackages.${system};
      pkgsStable = nixpkgsStable.legacyPackages.${system};
    in {
    nixosConfigurations = {
      legacy = lib.nixosSystem {
        inherit system;
        modules = [ (./. + "/profiles"+("/"+profile)+"/configuration.nix") ];
        specialArgs = {
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
        modules = [ (./. + "/profiles"+("/"+profile)+"/home.nix") ];
	      extraSpecialArgs = {
          inherit username;
          inherit name;
          inherit email;
          inherit browser;
          inherit editor;
          inherit term;
          inherit allowUnfree;
          inherit pkgsStable;
          inherit nix-doom-emacs;
          inherit (inputs) nix-gaming;
        };
      };
    };
  };

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nixpkgsStable.url = "nixpkgs/nixos-23.11";
    nix-doom-emacs.url = "github:nix-community/nix-doom-emacs";
    nix-gaming.url = "github:fufexan/nix-gaming";
  };

}
