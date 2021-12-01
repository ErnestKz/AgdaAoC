with import (import ./nix/sources.nix).nixpkgs-unstable {};
let
  agdaWithPackages = (agda.withPackages (ps: [
    ps.standard-library
    ps.agda-prelude
  ]));
in
mkShell {
  buildInputs = [
    agdaWithPackages
  ];
}
    
