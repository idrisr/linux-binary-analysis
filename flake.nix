{
  inputs.nixpkgs.url = "nixpkgs";
  description = "linux binary analysis";
  outputs = { self, nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in with pkgs; {
      thing = stdenv.mkDerivation {
        name = "thing";
        src = fetchFromGitHub {
          repo = "learning-linux-binary-analysis";
          owner = "packtpublishing";
          rev = "df28101962d965ecd27459479e9d68226351ffe8";
          hash = "sha256-7l7lDTyoPxHvVH+2VTXhzW74C5d2qS7U0WAilWP/9k4=";
        };

        buildPhase = ''
          cd Chapter\ 03/src
          make
        '';

        installPhase = ''
          mkdir -p $out/bin
          mv vuln $out/bin
        '';
      };
    };
}
