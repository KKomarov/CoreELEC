# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2022-present Team CoreELEC (https://coreelec.org)

PKG_NAME="dtvparams"
PKG_VERSION="732ec3c365f007614e4987930a3933e6782cefc6"
# PKG_SHA256="e907c8977342827cb36b6ab436f316feb28acf61e836bcc9ea50aca1f5520263"
PKG_ARCH="arm aarch64"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/KKomarov/dtv_params"
PKG_URL="https://github.com/KKomarov/dtv_params/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux"
PKG_NEED_UNPACK="${LINUX_DEPENDS}"
PKG_LONGDESC="dtv_params test package"
PKG_IS_KERNEL_PKG="yes"
PKG_IS_ADDON="yes"
PKG_ADDON_IS_STANDALONE="yes"
PKG_ADDON_NAME="Test driver addon"
PKG_ADDON_TYPE="xbmc.service"
PKG_ADDON_VERSION="${ADDON_VERSION}.${PKG_REV}"

PKG_TOOLCHAIN="manual"

make_target() {
  echo "making BT"
  # cp -f ${PKG_DIR}/Makefile ${PKG_DIR}/Kconfig ${PKG_BUILD}
  kernel_make V=1 -C ${PKG_BUILD} \
    M=${PKG_BUILD} \
    KERNEL_SRC=$(kernel_path) \
    CURFOLDER=${PKG_BUILD} \
    modules
}

makeinstall_target() {
  touch "${PKG_BUILD}/changelog.txt"
  install_driver_addon_files "${PKG_BUILD}/dtv_params.ko"
}
