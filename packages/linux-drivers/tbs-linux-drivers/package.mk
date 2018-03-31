################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-present Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="tbs-linux-drivers"
PKG_VERSION="v170330"
PKG_ARCH="x86_64"
PKG_LICENSE="GPL"
PKG_SITE="http://www.tbsdtv.com/english/Download.html"
PKG_URL="http://www.tbsdtv.com/download/document/common/${PKG_NAME}_${PKG_VERSION}.zip"
PKG_DEPENDS_TARGET="toolchain linux"
PKG_NEED_UNPACK="$LINUX_DEPENDS"
PKG_SECTION="driver"
PKG_SHORTDESC="Linux TBS tuner drivers"
PKG_LONGDESC="Linux TBS tuner drivers"
PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

unpack() {
  mkdir -p $PKG_BUILD
  unzip $SOURCES/$PKG_NAME/$PKG_NAME-$PKG_VERSION.zip -d $PKG_BUILD
}

post_unpack() {
  tar xjf $PKG_BUILD/linux-tbs-drivers.tar.bz2 -C $PKG_BUILD
  chmod -R u+rwX $PKG_BUILD/linux-tbs-drivers/*
}

pre_make_target() {
  export KERNEL_VER=$(get_module_dir)
  export LDFLAGS=""
}

make_target() {
  cd $PKG_BUILD/linux-tbs-drivers
  ./v4l/tbs-x86_64.sh
  make VER=$KERNEL_VER DIR=$(kernel_path) prepare
  make VER=$KERNEL_VER DIR=$(kernel_path)
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/modules/$KERNEL_VER/updates/tbs
  find $PKG_BUILD/linux-tbs-drivers/ -name \*.ko -exec cp {} $INSTALL/usr/lib/modules/$KERNEL_VER/updates/tbs \;
  mkdir -p $INSTALL/lib/firmware/
  cp $PKG_BUILD/*.fw $INSTALL/lib/firmware/
}
