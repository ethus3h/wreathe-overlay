# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit autotools

myCommit="72e41af057017e30a3014cf7e60dbe37ca482720"
DESCRIPTION="Expanded md5sum program with recursive and comparison options"
HOMEPAGE="http://md5deep.sourceforge.net/"
SRC_URI="https://github.com/jessek/hashdeep/archive/${myCommit}.zip -> ${P}-${myCommit}.zip
	http://web.archive.org/web/20170329003507/https://patch-diff.githubusercontent.com/raw/jessek/hashdeep/pull/364.diff -> ${P}-null.patch"

LICENSE="public-domain GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~mips ~ppc ~ppc64 ~x86 ~amd64-linux ~x86-linux ~ppc-macos"
RESTRICT="test"
S="${WORKDIR}/hashdeep-${myCommit}"

DOCS="AUTHORS ChangeLog FILEFORMAT NEWS README TODO"

src_prepare() {
	eapply_user
	epatch "${WORKDIR}/${PN}-null.patch"
	eautoreconf
}
