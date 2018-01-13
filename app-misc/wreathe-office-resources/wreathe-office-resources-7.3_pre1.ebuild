# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Office resources for Wreathe"
HOMEPAGE="https://futuramerlin.com/"
SRC_URI="https://github.com/ethus3h/wreathe-office-resources/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64"
RDEPEND="app-misc/wreathe-base"

src_install() {
	insinto /Wreathe/
	GLOBIGNORE="README.md:.git:.egup.tags"
	doins -r *
	unset GLOBIGNORE
}
