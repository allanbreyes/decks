with import <nixpkgs> {};

stdenv.mkDerivation {
  name = "node";
  buildInputs = [
    go-task
    chromium
    nodejs
  ];
  shellHook = ''
    export PATH="$PWD/node_modules/.bin/:$PATH"
  '';
}
