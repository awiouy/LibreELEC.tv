################################################################################
#      This file is part of LibreELEC - https://libreelec.tv
#      Copyright (C) 2018-present Team LibreELEC
#
#  LibreELEC is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 2 of the License, or
#  (at your option) any later version.
#
#  LibreELEC is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with LibreELEC.  If not, see <http://www.gnu.org/licenses/>.
################################################################################

PKG_NAME="nfs-ganesha"
PKG_VERSION="2.6.2"
PKG_SHA256="90c799d35b30c314c82f823bf486088ee0e2aeab1933a0fe9cd0fe15e4f9c359"
PKG_REV="99d"
PKG_LICENSE="LGPLv3"
PKG_SITE="https://github.com/nfs-ganesha/nfs-ganesha/"
PKG_URL="https://github.com/nfs-ganesha/nfs-ganesha/archive/V$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain krb5 ntirpc"
PKG_SECTION="service"
PKG_SHORTDESC="NFS-Ganesha fileserver"
PKG_LONGDESC="NFS-Ganesha ($PKG_VERSION) is an NFS fileserver that runs in user mode"
PKG_TOOLCHAIN="cmake"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="NFS-Ganesha"
PKG_ADDON_TYPE="xbmc.service"
PKG_MAINTAINER="Anton Voyl (awiouy)"

PKG_CMAKE_OPTS_TARGET="-DKRB5_PREFIX=$SYSROOT_PREFIX/usr \
                       -DUSE_GSS=OFF \
                       -DUSE_SYSTEM_NTIRPC=ON"
PKG_CMAKE_SCRIPT="$PKG_BUILD/src/CMakeLists.txt"

addon() {
  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/bin
    cp $PKG_BUILD/.install_pkg/usr/bin/ganesha.nfsd \
       $ADDON_BUILD/$PKG_ADDON_ID/bin

  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/config
    cp $PKG_BUILD/.install_pkg/etc/ganesha/ganesha.conf \
       $ADDON_BUILD/$PKG_ADDON_ID/config

  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/lib
    cp -L $PKG_BUILD/.install_pkg/usr/lib/ganesha/libfsal*.so \
          $(get_build_dir ntirpc)/.install_pkg/usr/lib/libntirpc.so.?.? \
          $ADDON_BUILD/$PKG_ADDON_ID/lib
}
