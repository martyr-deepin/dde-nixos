{ pkgs ? import <nixpkgs> {} }:
let 
  makeScope = pkgs.lib.makeScope;

  libsForQt5 = pkgs.libsForQt5;
  
  packages = self: with self; {
    dtkcommon = callPackage ./pkgs/dtkcommon { };
  
    deepin-desktop-base = callPackage ./pkgs/deepin-desktop-base { };
  
    dtkcore = callPackage ./pkgs/dtkcore { };  
  };
in
makeScope libsForQt5.newScope packages
