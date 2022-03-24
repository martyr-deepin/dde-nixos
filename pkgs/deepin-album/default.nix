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
, opencv
, ffmpeg
, ffmpegthumbnailer
, breakpointHook
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

  nativeBuildInputs = [ cmake pkgconfig qttools wrapQtAppsHook breakpointHook ];

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
    opencv
    ffmpeg
    ffmpegthumbnailer
  ];

  cmakeFlags = [
    "-DCMAKE_INSTALL_PREFIX=$out"
    "-DCMAKE_INSTALL_LIBDIR=lib"
  ];

  postPatch = ''
    substituteInPlace src/CMakeLists.txt \
      --replace "set(PREFIX /usr)" "set(PREFIX $out)" \
      --replace "/usr/share/deepin-manual/manual-assets/application/)" "share/deepin-manual/manual-assets/application/)"

    substituteInPlace libUnionImage/CMakeLists.txt \
      --replace "set(PREFIX /usr)" "set(PREFIX $out)" \
  '';

  meta = with lib; {
    description = "A fashion photo manager for viewing and organizing pictures";
    homepage = "https://github.com/linuxdeepin/deepin-album";
    license = licenses.gpl3Plus;
    platforms = platforms.linux;
  };
}
