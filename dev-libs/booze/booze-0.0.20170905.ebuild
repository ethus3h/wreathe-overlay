# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

myCommit="79fcbc802221fef13cf4e5e2ce94de0ef4ec7c01"

DESCRIPTION="FUSE bindings for bash"
HOMEPAGE="https://github.com/zevweiss/booze"
SRC_URI="https://github.com/ethus3h/${PN}/archive/${myCommit}.zip -> ${P}-${myCommit}.zip"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

S="${WORKDIR}/${PN}-${myCommit}"

src_install() {
    dobin booze.sh
    dolib.so booze.so
}
