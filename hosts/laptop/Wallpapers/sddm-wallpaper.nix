{
  config,
  pkgs,
  system,
  ...
}:
let
  wallpaper = ./1308164.jpeg;
  lockscreenWallpaper = (pkgs.writeTextDir "share/sddm/themes/breeze/theme.conf.user" ''
    [General]
    background=${wallpaper}
    type=image
  '');
in
{
  environment.systemPackages = [ lockscreenWallpaper ];
}
