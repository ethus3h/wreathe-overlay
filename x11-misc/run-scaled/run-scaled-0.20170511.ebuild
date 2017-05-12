# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

myCommit="a7eb485cc719230b345c9e2fba57a42faafb0ef2"
myPn="run_scaled"
DESCRIPTION="Run an X application scaled via xpra."
HOMEPAGE="https://github.com/kaueraal/run_scaled"
SRC_URI="https://github.com/kaueraal/${myPn}/archive/${myCommit}.zip -> ${P}-${myCommit}.zip"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="x11-base/xorg-server[xvfb]
	>=x11-wm/xpra-2
	x11-libs/libXrandr"
DEPEND="${RDEPEND}"
S="${WORKDIR}/${myPn}-${myCommit}"

src_install() {
	exeinto /usr/bin
	GLOBIGNORE="README.md:LICENSE:.git"
	doexe *
	unset GLOBIGNORE
}
