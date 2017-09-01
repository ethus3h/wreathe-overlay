# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Wreathe installation bootstrapping package"
HOMEPAGE="https://futuramerlin.com/"
SRC_URI="https://github.com/ethus3h/wreathe-bootstrap/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"

src_install() {
	GLOBIGNORE="README.md:.git:.egup.tags"
	insinto /
	doins -r *
}
