{ pkgs ? import <nixpkgs> {} }:
let 
  makeScope = pkgs.lib.makeScope;

  newScope = pkgs.libsForQt5.newScope;
  
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
    gio-qt = callPackage ./pkgs/gio-qt { };
    udisks2-qt5 = callPackage ./pkgs/udisks2-qt5 { };
    deepin-gettext-tools = callPackage ./pkgs/deepin-gettext-tools { };
    deepin-album = callPackage ./pkgs/deepin-album { };
    deepin-image-viewer = callPackage ./pkgs/deepin-image-viewer { };
    deepin-boot-maker = callPackage ./pkgs/deepin-boot-maker { };
    deepin-calculator = callPackage ./pkgs/deepin-calculator { };
    deepin-devicemanager = callPackage ./pkgs/deepin-devicemanager { };
    deepin-font-manager = callPackage ./pkgs/deepin-font-manager { };
  };
in
makeScope newScope packages
