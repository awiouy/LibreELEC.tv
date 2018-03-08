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

if [ "$ARCH" == "arm" ]; then
  NC_ARCH="arm"
  PKG_SHA256="50e8955644ebbecce51ea2cd6f28a5db3b2b93b2f7201befae30da2fa17ac299"
else
  NC_ARCH="x64"
  PKG_SHA256="9c0080bd82ea26a5721fa063885c5675071af9741693e90efeb8eea8c70ac6bc"
fi

PKG_NAME="netcore"
PKG_VERSION="2.0.4"
PKG_REV="100a"
PKG_ARCH="arm x86_64"
PKG_LICENSE="MIT"
PKG_SITE="https://dotnet.github.io/"
PKG_URL="https://dotnetcli.blob.core.windows.net/dotnet/Runtime/release/2.0.0/dotnet-runtime-latest-linux-$NC_ARCH.tar.gz"
PKG_SOURCE_NAME="netcore-$PKG_VERSION-$ARCH.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="tools"
PKG_SHORTDESC=".Net Core: a general purpose development platform"
PKG_LONGDESC=".Net Core ($PKG_VERSION) .NET Core is a general purpose development platform."
PKG_TOOLCHAIN="manual"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME=".Net Core"
PKG_ADDON_TYPE="xbmc.python.script"
PKG_MAINTAINER="Anton Voyl (awiouy)"

unpack() {
  mkdir -p $PKG_BUILD
  $SCRIPTS/extract $PKG_NAME $PKG_BUILD
}

addon() {
  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/bin
  cp -r $PKG_BUILD/* $ADDON_BUILD/$PKG_ADDON_ID/bin
}
