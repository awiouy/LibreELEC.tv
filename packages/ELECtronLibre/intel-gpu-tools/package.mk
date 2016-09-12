PKG_NAME="intel-gpu-tools"
PKG_VERSION="1.16"
PKG_ARCH="x86_64"
PKG_LICENSE="OSS"
PKG_SITE="https://cgit.freedesktop.org/xorg/app/intel-gpu-tools/"
PKG_URL="https://cgit.freedesktop.org/xorg/app/intel-gpu-tools/snapshot/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain cairo glib"
PKG_AUTORECONF="yes"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="Intel GPU Tools"
PKG_ADDON_TYPE="xbmc.python.script"
PKG_REV="100"
PKG_SECTION="tools"
PKG_SHORTDESC="$PKG_ADDON_NAME"
PKG_LONGDESC="$PKG_ADDON_NAME ($PKG_VERSION)"

PKG_CONFIGURE_OPTS_TARGET="--enable-static \
                           --disable-shared \
                           --without-libunwind"

addon() {
  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID
  cp -PR $PKG_BUILD/.install_pkg/usr/* $ADDON_BUILD/$PKG_ADDON_ID/
  cp -L $(get_build_dir cairo)/.install_pkg/usr/lib/libcairo.so.2  \
        $(get_build_dir pixman)/.install_pkg/usr/lib/libpixman-1.so.0  \
        $ADDON_BUILD/$PKG_ADDON_ID/lib/
}
