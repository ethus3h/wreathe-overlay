# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Backgrounds for Wreathe"
HOMEPAGE="https://futuramerlin.com/"
SRC_URI="https://github.com/ethus3h/wreathe-backgrounds/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
RDEPEND="app-misc/wreathe-base"

src_install() {
	insinto /Wreathe/
	GLOBIGNORE="README.md:.git:.egup.tags:Themes"
	doins -r *
	unset GLOBIGNORE
	insinto /usr/share/wallpapers/
	doins -r Themes/*
}
