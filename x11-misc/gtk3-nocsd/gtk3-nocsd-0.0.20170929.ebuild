# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

myCommit="82ff5a0da54aa6da27232b55eb93e5f4b5de22f2"
DESCRIPTION="A hack to disable gtk3 client-side decorations"
HOMEPAGE="https://github.com/PCMan/gtk3-nocsd"

SRC_URI="https://github.com/PCMan/${PN}/archive/${myCommit}.zip -> ${P}-${myCommit}.zip"

SLOT="0"
KEYWORDS="~amd64"
LICENSE="LGPL-2.1"

DEPEND="x11-libs/gtk+:3"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${PN}-${myCommit}"

src_install() {
	emake prefix="${D}/usr" install

	doenvd "${FILESDIR}"/90gtk3-nocsd
}
