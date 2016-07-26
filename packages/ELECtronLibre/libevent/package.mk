PKG_NAME="libevent"
PKG_VERSION="2.0.22-stable"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="BSD"
PKG_SITE="http://libevent.org/"
PKG_URL="https://github.com/libevent/libevent/releases/download/release-$PKG_VERSION/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain libressl zlib"
PKG_PRIORITY="optional"
PKG_SECTION="tools"
PKG_SHORTDESC="libevent: a library for asynchronous event notification"
PKG_LONGDESC="The libevent API provides a mechanism to execute a callback function when a specific event occurs on a file descriptor or after a timeout has been reached. It is meant to replace the asynchronous event loop found in event-driven network servers."

PKG_IS_ADDON="no"

PKG_AUTORECONF="yes"
PKG_CONFIGURE_OPTS_TARGET="--disable-shared --enable-static --enable-openssl"

post_makeinstall_target() {
  rm -fr $INSTALL
}
