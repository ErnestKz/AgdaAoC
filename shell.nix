with import <nixpkgs> {};
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
    
