{ pkgs ? import <nixpkgs> {} }:
let 
  makeScope = pkgs.lib.makeScope;

  libsForQt5 = pkgs.libsForQt5;
  
  packages = self: with self; {
    deepin-desktop-base = callPackage ./pkgs/deepin-desktop-base { };
    dde-qt-dbus-factory = callPackage ./pkgs/dde-qt-dbus-factory { };
    dtkcommon = callPackage ./pkgs/dtkcommon { };
    dtkcore = callPackage ./pkgs/dtkcore { };
    dtkgui = callPackage ./pkgs/dtkgui { };
    dtkwidget = callPackage ./pkgs/dtkwidget { };
    qt5platform-plugins = callPackage ./pkgs/qt5platform-plugins { };
    qt5integration = callPackage ./pkgs/qt5integration { };
    image-editor = callPackage ./pkgs/image-editor { };
    udisks2-qt5 = callPackage ./pkgs/udisks2-qt5 { };
    deepin-album = callPackage ./pkgs/deepin-album { };
    deepin-boot-maker = callPackage ./pkgs/deepin-boot-maker { };
    deepin-calculator = callPackage ./pkgs/deepin-calculator { };
  };
in
makeScope libsForQt5.newScope packages
