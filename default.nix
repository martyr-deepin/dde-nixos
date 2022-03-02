{ pkgs ? import <nixpkgs> {} }:
{
  hello-nur = pkgs.callPackage ./pkgs/hello-nur {};
}
