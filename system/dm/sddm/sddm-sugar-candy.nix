{ pkgs, stdenv, fetchFromGitHub }:
{
  sddm-sugar-candy = stdenv.mkDerivation rec {
    pname = "sddm-sugar-candy";
    version = "5beb1c6";
    dontBuild = true;
    installPhase = ''
      mkdir -p $out/share/sddm/themes
      cp -aR $src $out/share/sddm/themes/sddm-sugar-candy
    '';
    src = ./sddm-sugar-candy;
  };
}
