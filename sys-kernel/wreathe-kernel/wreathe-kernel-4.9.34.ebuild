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
IUSE="compile experimental firmware"

DESCRIPTION="Built sources including the Gentoo patchset for the ${KV_MAJOR}.${KV_MINOR} kernel tree"
SRC_URI="${KERNEL_URI} ${GENPATCHES_URI} ${ARCH_URI}"

DEPEND="${DEPEND}
	compile? (
		app-admin/eselect
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
		insinto /
		rm "${WORKDIR}/kernel-build-dir/lib/modules/4.9.34-wreathe-Wreathe/build"
		rm "${WORKDIR}/kernel-build-dir/lib/modules/4.9.34-wreathe-Wreathe/source"
		(
			shopt -s dotglob
			doins -r "${WORKDIR}/kernel-build-dir"/*
			shopt -u dotglob
		)
		cp "${WORKDIR}/kernel-src-dir/.config" "${S}/.config"
		rm -r "${WORKDIR}/kernel-build-dir"
		rm -r "${WORKDIR}/kernel-src-dir"
		rm -r "${WORKDIR}/kernel-tmp-dir"
	fi
	kernel-2_src_install
}

pkg_postinst() {
	kernel-2_pkg_postinst
	if use compile; then
		eselect kernel set "linux-${PV}-wreathe"
		emerge @module-rebuild
		einfo "For more info on this patchset, and how to report problems, see:"
		einfo "${HOMEPAGE}"
		grub-mkconfig -o /boot/grub/grub.cfg && elog "Updated /boot/grub/grub.cfg"
		dosym /boot/grub/grub.cfg /boot/grub/grub.conf
		# Send notification about kernel update to users
		(
			getent passwd | while IFS=: read -r name password uid gid gecos home shell; do
				top="${home#/}"
				top="${top%%/*}"
				case $top in
					bin|dev|etc|lib*|no*|proc|sbin|usr|var)
						# probably not a human, so don't bother notfiying
						true
						;;
					*)
						DISPLAY=:0 sudo -u "$name" bash -c 'DISPLAY=:0 notify-send "Kernel update installed" "A kernel update has been installed. A system administrator can reboot the computer to use the new kernel."'
						;;
				esac
			done
		)
	fi
}

pkg_postrm() {
	kernel-2_pkg_postrm
}
