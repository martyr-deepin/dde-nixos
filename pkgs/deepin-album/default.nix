{ stdenv
, lib
, fetchFromGitHub
, dtkcommon
, dtkcore
, dtkgui
, dtkwidget
, qt5integration
, udisks2-qt5
, gio-qt
, image-editor
, cmake
, pkgconfig
, qttools
, wrapQtAppsHook
, glibmm
, freeimage
, ffmpegthumbnailer
}:

stdenv.mkDerivation rec {
  pname = "deepin-album";
  version = "5.9.6";

  src = fetchFromGitHub {
    owner = "linuxdeepin";
    repo = pname;
    rev = version;
    sha256 = "sha256-FPO7tKSCF7P5Rq7D5etxTb2PowYcCrtCL5bnIcruHPo=";
  };

  nativeBuildInputs = [ cmake pkgconfig qttools wrapQtAppsHook ];

  buildInputs = [
    dtkcommon
    dtkcore
    dtkgui
    dtkwidget
    qt5integration
    udisks2-qt5
    gio-qt
    image-editor
    glibmm
    freeimage
    ffmpegthumbnailer
  ];

  meta = with lib; {
    description = "A fashion photo manager for viewing and organizing pictures";
    homepage = "https://github.com/linuxdeepin/deepin-album";
    license = licenses.gpl3Plus;
    platforms = platforms.linux;
  };
}
