# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="5"
ETYPE="sources"
K_WANT_GENPATCHES="base extras experimental"
K_GENPATCHES_VER="18"

inherit kernel-2
detect_version
detect_arch

KEYWORDS="~amd64 ~x86"
HOMEPAGE="https://dev.gentoo.org/~mpagano/genpatches"
IUSE="experimental"

DESCRIPTION="Full sources including the Gentoo patchset for the ${KV_MAJOR}.${KV_MINOR} kernel tree"
SRC_URI="${KERNEL_URI} ${GENPATCHES_URI} ${ARCH_URI} https://web.archive.org/web/20170331071516/https://raw.githubusercontent.com/ethus3h/wreathe-overlay/b256aa724cedc3aba34686807d1322073f916d7a/sys-kernel/wreathe-kernel/files/wreathe-kernel.config"

DEPEND="${DEPEND}
	sys-kernel/genkernel-next"

pkg_postinst() {
	kernel-2_pkg_postinst
	einfo "For more info on this patchset, and how to report problems, see:"
	einfo "${HOMEPAGE}"
}

src_compile() {
	kernel-2_src_compile
	genkernel \
		--kernel-config="${WORKDIR}/wreathe-kernel.config" \
		--kerneldir=. \
		--logfile=./genkernel.log \
		--no-menuconfig \
		--plymouth \
		--plymouth-theme=simply_line \
		all
}

pkg_postrm() {
	kernel-2_pkg_postrm
}
