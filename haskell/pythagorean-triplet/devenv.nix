{ pkgs, ... }:
with pkgs.haskell.lib;
with pkgs.haskellPackages;
with pkgs;
let exercism = dontHaddock (callCabal2nix "exercism" ./. {});
in
{
  env.GREET = "exercism";
  packages = [ hpack (ghcWithPackages (p: with p; [ exercism cabal-install haskell-language-server ])) ];
  scripts.hello.exec = "echo hello from $GREET";
  enterShell = ''
    hello
    git --version
  '';
}
