################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-present Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="oem"
PKG_VERSION=""
PKG_ARCH="any"
PKG_LICENSE="various"
PKG_SITE="http://alexelec.in.ua"
PKG_URL=""
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="virtual"
PKG_SHORTDESC="OEM: Metapackage for various OEM packages"
PKG_LONGDESC="OEM: Metapackage for various OEM packages"
PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

# tv services
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET tvheadend oscam"

# services net
#  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET transmission"

# tools
#  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET ImageMagick mc scan-m3u serviceref htop"
