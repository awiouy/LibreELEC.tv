PKG_NAME="sonarr_libmediainfo"
PKG_VERSION="0.7.87"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://mediaarea.net/en/MediaInfo/Download/Source"
PKG_URL="http://mediaarea.net/download/source/libmediainfo/$PKG_VERSION/libmediainfo_$PKG_VERSION.tar.bz2"
PKG_SOURCE_DIR="MediaInfoLib"
PKG_DEPENDS_TARGET="toolchain libzen zlib"
PKG_PRIORITY="optional"
PKG_SECTION="multimedia"
PKG_SHORTDESC="MediaInfo is a convenient unified display of the most relevant technical and tag data for video and audio files"
PKG_LONGDESC="MediaInfo is a convenient unified display of the most relevant technical and tag data for video and audio files"
PKG_AUTORECONF="no"

PKG_IS_ADDON="no"

make_target() {
  cd Project/GNU/Library
  do_autoreconf
  ./configure \
        --host=$TARGET_NAME \
        --build=$HOST_NAME \
        --disable-static \
        --enable-shared \
        --prefix=/usr \
        --enable-visibility \
        --disable-libcurl \
        --disable-libmms
  make
}
