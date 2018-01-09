################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-present Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="tz"
PKG_VERSION="2017c"
PKG_ARCH="any"
PKG_LICENSE="Public Domain"
PKG_SITE="http://www.iana.org/time-zones"
PKG_URL="https://github.com/eggert/tz/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="system"
PKG_SHORTDESC="tzdata"
PKG_LONGDESC="tzdata"
PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

PKG_MAKE_OPTS_TARGET="CC=$HOST_CC LDFLAGS="

makeinstall_target() {
  make TOPDIR="$INSTALL" install
}

post_makeinstall_target() {
  mkdir -p $INSTALL/usr/share/zoneinfo
  mv $INSTALL/etc/zoneinfo/* $INSTALL/usr/share/zoneinfo

  rm -rf $INSTALL/etc
  mkdir -p $INSTALL/etc
    ln -sf /var/run/localtime $INSTALL/etc/localtime
}

post_install() {
  enable_service tz-data.service
}
