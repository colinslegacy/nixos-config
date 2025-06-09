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
    src = fetchFromGitHub {
      owner = "colinslegacy";
      repo = "sddm-sugar-candy";
      rev = "d668eaf31275af183dab0e40871b315a4d5c8a95";
      sha256 = "sha256-SLdGQsqdliBwy66iwIwR3LEDYv23VbVWxB1SHdA0p3k=";
    };
  };
}
