# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

myCommit="14831de6380b45489d514b34cd2ea921f37baff0"

DESCRIPTION="FUSE bindings for bash"
HOMEPAGE="https://github.com/zevweiss/booze"
SRC_URI="https://github.com/zevweiss/${PN}/archive/${myCommit}.zip -> ${P}-${myCommit}.zip"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

S="${WORKDIR}/${PN}-${myCommit}"

src_install() {
    dobin booze.sh
    dolib.so booze.so
}
