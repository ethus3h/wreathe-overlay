# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit autotools git-r3

myCommit="72e41af057017e30a3014cf7e60dbe37ca482720"
DESCRIPTION="Expanded md5sum program with recursive and comparison options"
HOMEPAGE="http://md5deep.sourceforge.net/"
SRC_URI="https://github.com/jessek/hashdeep/archive/${myCommit}.zip -> ${P}-${myCommit}.zip"

LICENSE="public-domain GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~mips ~ppc ~ppc64 ~x86 ~amd64-linux ~x86-linux ~ppc-macos"
RESTRICT="test"

DOCS="AUTHORS ChangeLog FILEFORMAT NEWS README TODO"

src_prepare() {
	eapply_user
	epatch "${FILESDIR}/${PN}-null.patch"
	eautoreconf
}
