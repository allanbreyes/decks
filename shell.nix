{ pkgs }:

with pkgs; pkgs.stdenv.mkDerivation {
  name = "node";
  buildInputs = [
    chromium
    go-task
    node2nix
    nodejs
  ];
  shellHook = ''
    export PATH="$PWD/node_modules/.bin:$PATH"
  '';
}
