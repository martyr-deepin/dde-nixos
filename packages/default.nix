{ pkgs ? import <nixpkgs> { } }:
let
  makeScope = pkgs.lib.makeScope;

  newScope = pkgs.deepin.newScope;

  packages = self: with self; {

    ### CORE
    dde-kwin = callPackage ./core/dde-kwin { };
    deepin-kwin = callPackage ./core/deepin-kwin { };
    #### MISC
    nixos-gsettings-schemas = callPackage ./misc/nixos-gsettings-schemas { };
  };
in
makeScope newScope packages
