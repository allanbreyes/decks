{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
  };

  outputs = { self, nixpkgs }: let
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
  in {
    packages = {
      default = pkgs.hello;
    };
    devShell.x86_64-linux = import ./shell.nix { inherit pkgs; };
  };
}
