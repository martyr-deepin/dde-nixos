{ pkgs ? import <nixpkgs> {} }:
{
  dtkcommon = pkgs.qt5.callPackage ./pkgs/dtkcommon {};
  deepin-desktop-base = pkgs.callPackage ./pkgs/deepin-desktop-base {};
}
