# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

myCommit="148cb999f91cec4ca3cdbf1fcc6deee5bce31fb1"

DESCRIPTION="FUSE bindings for bash"
HOMEPAGE="https://github.com/zevweiss/booze"
SRC_URI="https://github.com/ethus3h/${PN}/archive/${myCommit}.zip -> ${P}-${myCommit}.zip"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
RDEPEND="app-misc/ember-shared"
DEPEND="${RDEPEND}"

S="${WORKDIR}/${PN}-${myCommit}"

src_install() {
    dobin booze.sh
    dolib.so booze.so
}
