# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

MY_PN="wreathe-base"
if [[ "${PV}" == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/ethus3h/${MY_PN}.git"
	KEYWORDS=""
else
	SRC_URI="https://github.com/ethus3h/${MY_PN}/archive/v${PV}.tar.gz -> ${MY_PN}${PV}.tar.gz"
	KEYWORDS="~amd64"
fi

DESCRIPTION="Wreathe: extra configuration files"
HOMEPAGE="https://futuramerlin.com/"
LICENSE="AGPL-3"
SLOT="0"

RDEPEND="app-misc/wreathe-base"

src_prepare() {
	default
	rm -r ./*.patch ./*.txt ./*.md config config.gz build debian-package-generate etc/asound.conf etc/bash etc/cron.d etc/env.d etc/genkernel.conf etc/gitconfig etc/gtk-3.0 etc/kernels etc/portage etc/sddm.conf etc/xprofile etc/portage etc/kernels etc/skel etc/systemd etc/wreathe etc/xdg man usr var Wreathe Wreathe-WIP-and-reference
}

src_install() {
	GLOBIGNORE="README.md:.git:.gitattributes:.gitconfig:usr:man:Makefile:build:Wreathe:.travis.yml:.egup.branches:.egup.git-config:.egup.hooks:.egup.refs:.egup.remotes:.egup.stat:.egup.tags:.egup.version"
	insinto /
	doins -r ./*
}
