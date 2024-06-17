{ pkgs }:

# sugar dark for qt5
/* pkgs.stdenv.mkDerivation {
  name = "sugar-dark";
  src = pkgs.fetchFromGitHub {
    owner = "MarianArlt";
    repo = "sddm-sugar-dark";
    rev = "ceb2c455663429be03ba62d9f898c571650ef7fe";
    sha256 = "0153z1kylbhc9d12nxy9vpn0spxgrhgy36wy37pk6ysq7akaqlvy";
  };
  installPhase = ''
    mkdir -p $out
    cp -R ./* $out/
  '';
} */

# Puppy's SDDM Theme qt6
pkgs.stdenv.mkDerivation {
  name = "SDDM-Theme";
  src = pkgs.fetchFromGitHub {
    owner = "PuppyAnimations";
    repo = "SDDM-Theme";
    rev = "b9f30c62d8a1f0eba3d67e34fb0bb7c2ae3234d2";
    sha256 = "15hzmn6manrlg03adgy0mgs1wf85i0dc9pbp7gsjkzm6cinlwm97";
  };
  installPhase = ''
    mkdir -p $out
    cp -R ./* $out/
  '';
}