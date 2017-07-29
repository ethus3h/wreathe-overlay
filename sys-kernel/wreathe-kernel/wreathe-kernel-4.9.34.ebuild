# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"
ETYPE="sources"
K_WANT_GENPATCHES="base extras experimental"
K_GENPATCHES_VER="35"

inherit kernel-2
detect_version
detect_arch

KEYWORDS="alpha amd64 ~arm ~arm64 hppa ia64 ~mips ppc ppc64 ~s390 ~sh sparc x86"
HOMEPAGE="https://dev.gentoo.org/~mpagano/genpatches"
IUSE="experimental firmware"

DESCRIPTION="Built sources including the Gentoo patchset for the ${KV_MAJOR}.${KV_MINOR} kernel tree"
SRC_URI="${KERNEL_URI} ${GENPATCHES_URI} ${ARCH_URI}"

DEPEND="${DEPEND}
	sys-kernel/genkernel-next
	sys-apps/busybox
	firmware? ( sys-kernel/linux-firmware app-portage/gentoolkit )
	!firmware? ( !sys-kernel/linux-firmware )"

pkg_pretend() {
	mountpoint -q /boot || die "/boot needs to be mounted to use the automated kernel ebuild."
}

pkg_postinst() {
	kernel-2_pkg_postinst
	einfo "For more info on this patchset, and how to report problems, see:"
	einfo "${HOMEPAGE}"
}

src_compile() {
	kernel-2_src_compile
	cp -r "${S}" "${WORKDIR}/kernel-src-dir"
	(
		mkdir -p "${WORKDIR}/kernel-build-dir/boot"
		mkdir "${WORKDIR}/kernel-tmp-dir"
		cd "${WORKDIR}/kernel-build-dir" || die
		genkernel \
			--bootdir="${WORKDIR}/kernel-build-dir/boot" \
			--cachedir="${WORKDIR}/kernel-tmp-dir/genkernel.cache" \
			--kernel-config="${FILESDIR}/wreathe.config" \
			--kerneldir="${WORKDIR}/kernel-src-dir" \
			--logfile="${WORKDIR}/kernel-tmp-dir/genkernel.log" \
			--module-prefix="${WORKDIR}/kernel-build-dir" \
			--no-menuconfig \
			--no-mountboot \
			--no-save-config \
			--plymouth \
			--plymouth-theme=simply_line \
			--tempdir="${WORKDIR}/kernel-tmp-dir/genkernel.tmp" \
			all || die "Genkernel reported a failure status."
	)
}

src_install() {
	if use firmware; then
		(
			containsElement () {
				local e
				for e in "${@:2}"; do [[ "$e" == "$1" ]] && return 0; done
				return 1
			}
			readarray externalFirmware <<< "$(equery -Cq f linux-firmware)"
			
		)
	fi
	insinto /
	(
		shopt -s dotglob
		doins -r "${WORKDIR}/kernel-build-dir"/*
		shopt -u dotglob
	)
	rm -r "${WORKDIR}/kernel-build-dir"
	rm -r "${WORKDIR}/kernel-src-dir"
	rm -r "${WORKDIR}/kernel-tmp-dir"
	kernel-2_src_install
}

pkg_postinst() {
	kernel-2_pkg_postinst
	einfo "For more info on this patchset, and how to report problems, see:"
	einfo "${HOMEPAGE}"
}

pkg_postrm() {
	kernel-2_pkg_postrm
}
