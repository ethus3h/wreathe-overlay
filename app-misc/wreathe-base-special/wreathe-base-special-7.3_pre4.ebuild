# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

MY_PN="wreathe-base"
if [[ "${PV}" == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/ethus3h/${MY_PN}.git"
	KEYWORDS=""
else
	SRC_URI="https://github.com/ethus3h/${MY_PN}/archive/v${PV}.tar.gz -> ${MY_PN}-${PV}.tar.gz"
	KEYWORDS="~amd64"
fi

DESCRIPTION="Wreathe: extra configuration files (Careful! See warning in ebuild)"
# WARNING: This package provides /etc/security/limits.conf. Installing this package will overwrite that file, and removing this package will remove that file, the absence of which may break use of the "sudo" and "su" commands.
HOMEPAGE="https://futuramerlin.com/"
LICENSE="AGPL-3"
SLOT="0"

RDEPEND="app-misc/wreathe-base"

src_prepare() {
	default
	rm -r README.md .git .gitmodules .egup.* || die
	rm -r ./*.md build debian-package-generate man usr var Wreathe || die
	rm -r etc/asound.conf etc/bash etc/cron.d etc/env.d etc/genkernel.conf etc/gitconfig etc/gtk-3.0 etc/kernels etc/portage etc/pulse etc/sddm.conf etc/skel etc/systemd etc/wreathe etc/xdg etc/xprofile || die
	rm Makefile || die
}

src_install() {
	insinto /
	doins -r ./*
}
