# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

myCommit="0c9b0a360ecdda96a2a71872d495e009a42aa699"

DESCRIPTION="CMap Resources"
HOMEPAGE="https://github.com/adobe-type-tools/cmap-resources"
SRC_URI="https://github.com/adobe-type-tools/${PN}/archive/${myCommit}.zip -> ${P}-${myCommit}.zip"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"

S="${WORKDIR}/${PN}-${myCommit}"

src_install() {
    emake DESTDIR="${D}" install
}
