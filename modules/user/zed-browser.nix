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

  programs.zen-browser.enable = true;

  programs.zen-browser.profiles.default =
    let
      containers = {
        Personal = {
          color = "blue";
          id = 1;
        };
        NAS = {
          color = "red";
          id = 2;
        };
      };
      spaces = {
        "Personal" = {
          id = "497dcba3-ecbf-4587-a2dd-5eb0665e6880";
          position = 1000;
          container = containers.Personal.id;
        };
        "NAS" = {
          id = "3806fceb-568c-4d61-9f3b-e0c7f2f66707";
          position = 2000;
          container = containers.NAS.id;
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
        "Ebay" = {
          id = "d2b82219-bd40-4574-a455-487eeb53be87";
          container = containers.Personal.id;
          url = "https://www.ebay.com";
          isEssential = true;
          position = 105;
        };
        "X" = {
          id = "9b72f5c1-ffff-486c-bd3d-aa6654ada0c2";
          container = containers.Personal.id;
          url = "https://x.com";
          isEssential = true;
          position = 106;
        };
        "ADM" = {
          id = "29039df6-fc96-4e2b-8332-ceaec977b65c";
          container = containers.NAS.id;
          url = "http://adm.legacy.local";
          isEssential = true;
          position = 201;
        };
        "Nginx Proxy Manager" = {
          id = "d0f3b381-7abf-458c-96c2-537048877e4d";
          container = containers.NAS.id;
          url = "http://npm.legacy.local";
          isEssential = true;
          position = 202;
        };
        "Pi-hole" = {
          id = "bb61fef5-6a80-4754-8f29-ec02f46cd648";
          container = containers.NAS.id;
          url = "http://pihole.legacy.local/admin";
          isEssential = true;
          position = 203;
        };
        "Portainer" = {
          id = "24952aad-2741-4a74-bcde-339047c3d3e8";
          container = containers.NAS.id;
          url = "http://portainer.legacy.local";
          isEssential = true;
          position = 204;
        };
        "Plex" = {
          id = "90e788dc-e876-4fba-9677-1f3d86d7f789";
          container = containers.NAS.id;
          url = "http://plex.legacy.local";
          isEssential = true;
          position = 205;
        };
        "Overseerr" = {
          id = "a8d0a50c-2864-4d76-858f-a5a532a9b23d";
          container = containers.NAS.id;
          url = "http://overseerr.legacy.local";
          isEssential = true;
          position = 206;
        };
        "Prowlarr" = {
          id = "41bebbcc-a271-4577-ac37-81ea6654faef";
          container = containers.NAS.id;
          url = "http://prowlarr.legacy.local";
          isEssential = true;
          position = 207;
        };
        "Radarr" = {
          id = "f7ce9964-cdbe-4993-a7d1-17e4c70a8b2b";
          container = containers.NAS.id;
          url = "http://radarr.legacy.local";
          isEssential = true;
          position = 208;
        };
        "Sonarr" = {
          id = "9db860c7-cdae-4257-85c3-5c1090c8e6f5";
          container = containers.NAS.id;
          url = "http://sonarr.legacy.local";
          isEssential = true;
          position = 209;
        };
        "Immich" = {
          id = "c43488d7-a144-46cc-bbc8-4dfdc359a335";
          container = containers.NAS.id;
          url = "http://immich.legacy.local";
          isEssential = true;
          position = 210;
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
