{
  description = "A lua dev Env for my development";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      {
        defaultPackage = pkgs.mkShell{

            buildInputs = with pkgs; 
            [
              lua 
              lua-language-server
              nodejs_22
              nodePackages_latest.prettier

            ];
            shellHook = ''
            zsh
            echo "Entering lua dev env"
            '';
          };
      }
    );
}
