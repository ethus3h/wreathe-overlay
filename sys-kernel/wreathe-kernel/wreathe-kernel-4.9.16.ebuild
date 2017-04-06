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

wreatheCommit="1f1dd291903f41c33a1d518c489b6d7a03e505f6"
DESCRIPTION="Full sources including the Gentoo patchset for the ${KV_MAJOR}.${KV_MINOR} kernel tree"
SRC_URI="${KERNEL_URI} ${GENPATCHES_URI} ${ARCH_URI} https://raw.githubusercontent.com/ethus3h/wreathe/1f1dd291903f41c33a1d518c489b6d7a03e505f6/etc/kernels/wreathe-kernel.config -> ${P}-${wreatheCommit}.config"

DEPEND="${DEPEND}
	sys-kernel/genkernel-next"

pkg_pretend() {
	mountpoint -q /boot || die
}

pkg_postinst() {
	kernel-2_pkg_postinst
	einfo "For more info on this patchset, and how to report problems, see:"
	einfo "${HOMEPAGE}"
}

src_compile() {
	kernel-2_src_compile
	mkdir "${WORKDIR}/boot"
	genkernel \
		--bootdir="${WORKDIR}/boot" \
		--cachedir=./genkernel.cache \
		--kernel-config="${DISTDIR}/${P}-${wreatheCommit}.config" \
		--kerneldir=. \
		--logfile=./genkernel.log \
		--module-prefix="${WORKDIR}" \
		--no-menuconfig \
		--no-mountboot \
		--plymouth \
		--plymouth-theme=simply_line \
		--tempdir=./genkernel.tmp \
		all || die "Genkernel reported a failure status."
}

src_install() {
	default
	cp "${WORKDIR}/boot" "${DESTDIR}"
}

pkg_postrm() {
	kernel-2_pkg_postrm
}
