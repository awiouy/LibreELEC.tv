# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2017 Shane Meagher (shanemeagher)
# Copyright (C) 2017-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="librespot"
PKG_VERSION="5d2cb32e20815f3b7879962e8af2fb9ef4c3870d"
PKG_SHA256="98c8d49b8b298bde6eb401db8a19e221ccf0956f6d62e9cbf1fdc56ca8f03100"
PKG_VERSION_DATE="2019-04-16"
PKG_REV="116"
PKG_ARCH="any"
PKG_LICENSE="MIT"
PKG_SITE="https://github.com/librespot-org/librespot/"
PKG_URL="https://github.com/librespot-org/librespot/archive/$PKG_VERSION.zip"
PKG_DEPENDS_TARGET="toolchain avahi pulseaudio rust"
PKG_SECTION="service"
PKG_SHORTDESC="Librespot: play Spotify through Kodi using a Spotify app as a remote"
PKG_LONGDESC="Librespot ($PKG_VERSION_DATE) plays Spotify through Kodi using the open source librespot library using a Spotify app as a remote."
PKG_TOOLCHAIN="manual"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="Librespot"
PKG_ADDON_TYPE="xbmc.service"
PKG_MAINTAINER="Anton Voyl (awiouy)"

configure_target() {
  . "$TOOLCHAIN/.cargo/env"
  export PKG_CONFIG_ALLOW_CROSS=0
}

make_target() {
  cd src
  $CARGO_BUILD --no-default-features --features "pulseaudio-backend with-dns-sd"
  cd "$PKG_BUILD/.$TARGET_NAME"/*/release
  $STRIP librespot
}

addon() {
  mkdir -p "$ADDON_BUILD/$PKG_ADDON_ID/bin"
    cp "$PKG_BUILD/.$TARGET_NAME"/*/release/librespot  \
       "$ADDON_BUILD/$PKG_ADDON_ID/bin"

  mkdir -p "$ADDON_BUILD/$PKG_ADDON_ID/lib"
    cp "$(get_build_dir avahi)/avahi-compat-libdns_sd/.libs/libdns_sd.so.1" \
       "$ADDON_BUILD/$PKG_ADDON_ID/lib"
}
