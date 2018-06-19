# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

MYCOMMIT="b5a0a61d35abe26c46b1f890a94bd58bb17871bb"
DESCRIPTION="Opensnap brings the Aero Snap feature to Openbox."
HOMEPAGE="https://github.com/lawl/opensnap"

SRC_URI="https://github.com/lawl/${PN}/archive/${MYCOMMIT}.zip -> ${P}-${MYCOMMIT}.zip"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
RDEPEND="x11-misc/wmctrl
		x11-libs/libX11
		x11-libs/gtk+:3"

DEPEND="${RDEPEND}"

S="${WORKDIR}/${PN}-${MYCOMMIT}"

src_install() {
	exeinto /usr/bin/
	doexe bin/opensnap
	insinto /etc/opensnap/
	GLOBIGNORE=".git"
	doins sample_configs/*
	unset GLOBIGNORE
}
