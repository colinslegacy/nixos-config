{
  pkgs,
  system,
  inputs,
  ...
}:
{
  imports = [
    inputs.zen-browser.homeModules.beta
  ];

  home.packages = [
    inputs.nixvim-config.packages.${system}.default
  ];

  programs.zen-browser.enable = true;

  programs.zen-browser.profiles.default =
    let
      containers = {
        Personal = {
          color = "blue";
          id = 1;
        };
      };
      spaces = {
        "Personal" = {
          id = "497dcba3-ecbf-4587-a2dd-5eb0665e6880";
          position = 1000;
          container = containers.Personal.id;
        };
      };
      pins = {
        "YouTube" = {
          id = "46ca6849-65c3-4c14-af1d-e0254845f4a3";
          container = containers.Personal.id;
          url = "https://www.youtube.com";
          isEssential = true;
          position = 101;
        };
        "GitHub" = {
          id = "2b52086a-56ff-44f1-a8cf-ec44a6678bdf";
          container = containers.Personal.id;
          url = "https://github.com";
          isEssential = true;
          position = 102;
        };
        "Reddit" = {
          id = "9bfc6a02-9989-483b-8a71-80281d5d1380";
          container = containers.Personal.id;
          url = "https://www.reddit.com";
          isEssential = true;
          position = 103;
        };
        "Amazon" = {
          id = "2f92eacb-5a9c-41d3-9d7f-61c171b4707f";
          container = containers.Personal.id;
          url = "https://www.amazon.com";
          isEssential = true;
          position = 104;
        };
        "X" = {
          id = "9b72f5c1-ffff-486c-bd3d-aa6654ada0c2";
          container = containers.Personal.id;
          url = "https://x.com";
          isEssential = true;
          position = 105;
        };
      };
      extensions = {
        packages = with pkgs.nur.repos.rycee.firefox-addons; [
          ublock-origin
          onepassword-password-manager
          tampermonkey
        ];
      };
    in
    {
      containersForce = true;
      pinsForce = true;
      spacesForce = true;
      inherit
        containers
        pins
        spaces
        extensions
        ;
    };
}
