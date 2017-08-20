# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"
ETYPE="sources"
K_WANT_GENPATCHES="base extras experimental"
K_GENPATCHES_VER="6"

inherit kernel-2
detect_version
detect_arch

KEYWORDS="~amd64"
HOMEPAGE="https://dev.gentoo.org/~mpagano/genpatches"
IUSE="compile experimental firmware"

DESCRIPTION="Built sources including the Gentoo patchset for the ${KV_MAJOR}.${KV_MINOR} kernel tree"
SRC_URI="${KERNEL_URI} ${GENPATCHES_URI} ${ARCH_URI}"

DEPEND="${DEPEND}
	compile? (
		app-admin/eselect
		app-misc/wreathe-base
		sys-apps/portage
		sys-apps/busybox
		sys-boot/grub:2
		sys-kernel/genkernel-next
		firmware? ( app-portage/gentoolkit sys-kernel/linux-firmware )
		!firmware? ( !sys-kernel/linux-firmware )
	)"

src_compile() {
	kernel-2_src_compile
	if use compile; then
		cp -r "${S}" "${WORKDIR}/kernel-src-dir"
		cp -r "${S}" "${WORKDIR}/kernel-modsrc-dir"
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
	fi
}

pkg_preinst() {
	if use compile; then
		if ! mountpoint -q /boot; then
			[[ -d /boot ]] || mkdir /boot
			mount /boot || die "Could not mount /boot!"
		fi
	fi
}

src_install() {
	if use compile; then
		if use firmware; then
			(
				cd "${WORKDIR}/kernel-build-dir" || die
				contains() {
					local e
					for e in "${@:2}"; do [[ "$e" == "$1" ]] && return 0; done
					return 1
				}
				readarray externalFirmware <<< "$(equery -Cq f linux-firmware)"
				for i in "${!externalFirmware[@]}"; do
					temp="${externalFirmware[$i]}"
					# %? removes the last character
					externalFirmware[$i]="${temp%?}"
				done
				newFirmware=()
				while IFS=  read -r -d $'\0'; do
					newFirmware+=("$REPLY")
				done < <(find ./lib/firmware -print0)
				for file in "${newFirmware[@]}"; do
					if contains "$(tail -c +2 <<< "$file")" "${externalFirmware[@]}"; then
						rm "$file" &> /dev/null
					fi
				done
			)
		fi
		rm "${WORKDIR}/kernel-build-dir/lib/modules/4.9.34-wreathe-Wreathe/build"
		rm "${WORKDIR}/kernel-build-dir/lib/modules/4.9.34-wreathe-Wreathe/source"
		insinto /
		(
			shopt -s dotglob
			doins -r "${WORKDIR}/kernel-build-dir"/*
			shopt -u dotglob
		)
		cp "${WORKDIR}/kernel-src-dir/.config" "${S}/.config"
		cp "${WORKDIR}/kernel-src-dir"/*.symvers "${S}"
		cp "${WORKDIR}/kernel-src-dir/System.map" "${S}/System.map"
		rm -r "${WORKDIR}/kernel-build-dir"
		rm -r "${WORKDIR}/kernel-tmp-dir"
		rm -r "${WORKDIR}/kernel-src-dir"
		(
			# FIXME: Doesn't work
			# Makefile:539: arch/amd64/Makefile: No such file or directory
			# make: *** No rule to make target 'arch/amd64/Makefile'.  Stop.
			# Makefile:628: arch/amd64/Makefile: No such file or directory
			# make: *** No rule to make target 'arch/amd64/Makefile'.  Stop.
			cd "${WORKDIR}/kernel-modsrc-dir" || die
			make oldconfig
			make modules_prepare
		)
	fi
	kernel-2_src_install
	insinto "/usr/src/linux-${PV}-wreathe"
	(
		shopt -s dotglob
		doins -r "${WORKDIR}/kernel-modsrc-dir"/*
		shopt -u dotglob
	)
}

pkg_postinst() {
	kernel-2_pkg_postinst
	if use compile; then
		eselect kernel set "linux-${PV}-wreathe"
		dosym /boot/grub/grub.cfg /boot/grub/grub.conf
	fi
	einfo "For more info on this patchset, and how to report problems, see:"
	einfo "${HOMEPAGE}"
}

pkg_postrm() {
	kernel-2_pkg_postrm
}
