# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Redistributed typefaces package for Wreathe"
HOMEPAGE="https://futuramerlin.com/"
SRC_URI="https://github.com/ethus3h/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="freedist GPL-2 GPL-3 OFL OFL-1.1" #FIXME: non-libre stuff should be replaced and removed
SLOT="0"
KEYWORDS="~amd64"
RDEPEND="app-misc/wreathe-base"

src_install() {
	insinto /Wreathe/Typefaces/redist/
	GLOBIGNORE="README.md:.git:.egup.tags"
	doins -r *
	unset GLOBIGNORE
}
