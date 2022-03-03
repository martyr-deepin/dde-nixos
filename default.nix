{ pkgs ? import <nixpkgs> {} }:
{
  hello-nur = pkgs.callPackage ./pkgs/hello-nur {};
  dtkcommon = pkgs.qt5.callPackage ./pkgs/dtkcommon {};
}
