{ pkgs ? import <nixpkgs> {} }:
  let
    ghc = pkgs.haskellPackages.ghcWithPackages (ps: with ps; ([
      cabal-install
      stack
    ]));
  in
  pkgs.mkShell {
    name = "compsem";
    buildInputs = with pkgs; [
      ghc    
      llvmPackages_latest.libllvm
    ];
    shellHook = ''
        eval $(egrep ^export ${ghc}/bin/ghc)
    '';
}
