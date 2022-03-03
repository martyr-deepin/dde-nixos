{ pkgs ? import <nixpkgs> {} }:
{
  hello-nur = pkgs.callPackage ./pkgs/hello-nur {};
  dtkcommon = pkgs.qt5.callPackage ./pkgs/dtkcommon {};
  deepin-desktop-base = pkgs.callPackage ./pkgs/deepin-desktop-base {};
}
