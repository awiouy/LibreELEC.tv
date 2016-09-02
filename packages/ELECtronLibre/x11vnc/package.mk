PKG_NAME="x11vnc"
PKG_VERSION="104705f"
PKG_ARCH="x86_64"
PKG_LICENSE="OSS"
PKG_SITE="https://github.com/LibVNC/x11vnc"
PKG_URL="https://github.com/LibVNC/x11vnc/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain libX11 libXext libXtst libjpeg-turbo libvncserver"
PKG_AUTORECONF="yes"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="X11 VNC"
PKG_SHORTDESC="$PKG_ADDON_NAME: X11 VNC server"
PKG_LONGDESC="$PKG_ADDON_NAME ($PKG_VERSION) allows one to view remotely and interact with real X displays"
PKG_SECTION="service/system"
PKG_ADDON_TYPE="xbmc.service"
PKG_REV="100"
PKG_MAINTAINER="ELECtronlibre"

PKG_CONFIGURE_OPTS_TARGET="--enable-static"

pre_configure_target() {
  export LIBS="$LIBS -ljpeg -lpng -lpthread -lresolv -lz"
}

pre_build_target() {
  mkdir -p $PKG_BUILD/.$TARGET_NAME
  cp -RP $PKG_BUILD/* $PKG_BUILD/.$TARGET_NAME
}

makeinstall_target() {
  : # nop
}

addon() {
  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/bin
    cp $PKG_BUILD/.$TARGET_NAME/src/x11vnc $ADDON_BUILD/$PKG_ADDON_ID/bin
}
