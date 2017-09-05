# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

myCommit="7ab75a123571c092f51088e17b542b404a61d08f"

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
