# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="aixlog"
PKG_VERSION="1.3.0"
PKG_SHA256="748a00d3185eeb5cd8f0d751c4ef89d8c0948364024a432d2536eef883c9c782"
PKG_LICENSE="MIT"
PKG_SITE="https://github.com/badaix/aixlog"
PKG_URL="https://github.com/badaix/aixlog/archive/v$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="Header-only C++ logging library."
PKG_BUILD_FLAGS="-sysroot"

PKG_CMAKE_OPTS_TARGET="-DBUILD_EXAMPLE=OFF"
