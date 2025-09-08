{
  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixpkgs-unstable";
    };
    flake-utils = {
      url = "github:numtide/flake-utils";
    };
  };
  outputs =
    {
      nixpkgs,
      flake-utils,
      ...
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            # Core build tools
            ghc
            haskell-language-server
          ];

          shellHook = ''
            echo -e "\033[1;32m\n\nhaskell development environment loaded"
            echo -e "System: ${system}"
            echo -e "Available tools:"
            echo -e "  - ghc: $(which ghc 2>/dev/null || echo 'not found')"
            echo -e "\n\033[0m"
          '';
        };
      }
    );
}
