# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

myCommit="82ff5a0da54aa6da27232b55eb93e5f4b5de22f2"
DESCRIPTION="Opensnap brings the Aero Snap feature to Openbox."
HOMEPAGE="https://github.com/lawl/opensnap"

SRC_URI="https://github.com/lawl/${PN}/archive/${myCommit}.zip -> ${P}-${myCommit}.zip"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
RDEPEND="x11-misc/wmctrl
		x11-libs/libX11
		x11-libs/gtk+:3"

DEPEND="${RDEPEND}"

src_install() {
	exeinto /usr/bin/
	doexe bin/opensnap
	insinto /etc/opensnap/
	GLOBIGNORE=".git"
	doins sample_configs/*
	unset GLOBIGNORE
}
