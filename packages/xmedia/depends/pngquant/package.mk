################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-present Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="pngquant"
PKG_VERSION="2.9.1"
PKG_ARCH="any"
PKG_LICENSE="GPLv3"
PKG_SITE="https://pngquant.org"
PKG_URL="http://pngquant.org/pngquant-${PKG_VERSION}-src.tar.gz"
PKG_DEPENDS_HOST="toolchain libpng:host zlib:host"
PKG_SECTION="xmedia/depends"
PKG_SHORTDESC="lossy PNG compressor"
PKG_LONGDESC="a PNG compresor that significantly reduces file sizes by converting images to a more efficient 8-bit PNG format"
PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

configure_host() {
  : # none
}

make_host() {
  cd $PKG_BUILD
  BIN=$PKG_BUILD/pngquant make
  $STRIP $PKG_BUILD/pngquant
}

makeinstall_host() {
  mkdir -p $TOOLCHAIN/bin
    cp $PKG_BUILD/pngquant $TOOLCHAIN/bin
}
