{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
  };

  outputs = { self, nixpkgs, ... }: let
    marp = "@marp-team/marp-cli-2.2.0";
    node = pkgs.callPackage ./node { inherit pkgs system; };
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
    system = "x86_64-linux";
  in {
    apps.${system}.default = {
      type = "app";
      program = "${node.${marp}}/bin/marp";
    };
    packages.${system}.default = pkgs.stdenv.mkDerivation {
      name = "content";
      src = ./src;
      buildInputs = [
        pkgs.nodejs
        node.${marp}
      ];
      installPhase = ''
        export HOME=$(mktemp -d)
        mkdir -p $out
        cp -r ./img $out
        marp --config config.js --input-dir ./. --html --output $out
      '';
    };
    devShells.${system}.default = import ./shell.nix { inherit pkgs; };
  };
}
