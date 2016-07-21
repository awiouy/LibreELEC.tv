PKG_NAME="transmission"
PKG_VERSION="2.92"
PKG_REV="100"
PKG_ARCH="any"
PKG_LICENSE="OSS"
PKG_SITE="http://www.transmissionbt.com/"
PKG_URL="http://download.transmissionbt.com/files/$PKG_NAME-$PKG_VERSION.tar.xz"
PKG_DEPENDS_TARGET="toolchain curl libevent libressl zlib"
PKG_PRIORITY="optional"
PKG_SECTION="service"
PKG_SHORTDESC="Transmission: a fast, easy and free BitTorrent client"
PKG_LONGDESC="Transmission ($PKG_VERSION) is a fast, easy and free BitTorrent client"
PKG_AUTORECONF="yes"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="Transmission"
PKG_ADDON_TYPE="xbmc.service"
PKG_ADDON_PROVIDES=""
PKG_ADDON_REPOVERSION="8.0"
PKG_MAINTAINER="ELECtronLibre"

PKG_CONFIGURE_OPTS_TARGET="--enable-daemon      \
                           --enable-lightweight \
                           --enable-utp         \
                           --disable-nls        \
                           --with-gnu-ld"

makeinstall_target() {
  : # nop
}

addon() {
  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/bin
  cp $PKG_BUILD/.$TARGET_NAME/daemon/transmission-daemon $ADDON_BUILD/$PKG_ADDON_ID/bin
  cp $PKG_BUILD/.$TARGET_NAME/daemon/transmission-remote $ADDON_BUILD/$PKG_ADDON_ID/bin

  cp -PR $PKG_BUILD/web $ADDON_BUILD/$PKG_ADDON_ID
  rm -fr $ADDON_BUILD/$PKG_ADDON_ID/web/LICENSE
  find $ADDON_BUILD/$PKG_ADDON_ID/web -name "Makefile*" -delete
}
