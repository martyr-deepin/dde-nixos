{ stdenv
, lib
, fetchFromGitHub
, dtkcore
, dtkgui
, dtkwidget
, dtkcommon
, cmake
, qttools
, pkgconfig
, wrapQtAppsHook
, freeimage
}:

stdenv.mkDerivation rec {
  pname = "image-editor";
  version = "unstable-2021-09-17";

  src = fetchFromGitHub {
    owner = "linuxdeepin";
    repo = pname;
    rev = "3facb061e5929495b2bb3dd9dde5839f8ac901c6";
    sha256 = "sha256-b0uXJdJTK4QQHjQrPBWEfmRu1K0XH45ng5k0L3bPt8M=";
  };

  nativeBuildInputs = [ cmake pkgconfig wrapQtAppsHook ];

  postPatch = ''
    substituteInPlace libimage-viewer/CMakeLists.txt \
      --replace "set(PREFIX /usr)" "set(PREFIX $out)"
  '';

  buildInputs = [
    dtkcommon
    dtkcore
    dtkgui
    dtkwidget
    qttools
    freeimage
  ];

  meta = with lib; {
    description = "image editor lib for dtk";
    homepage = "https://github.com/linuxdeepin/image-editor";
    license = licenses.gpl3Plus;
    platforms = platforms.linux;
  };
}
