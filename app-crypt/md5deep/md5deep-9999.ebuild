# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit autotools git-r3

DESCRIPTION="Expanded md5sum program with recursive and comparison options"
HOMEPAGE="http://md5deep.sourceforge.net/"
EGIT_REPO_URI="git://github.com/jessek/hashdeep.git"

LICENSE="public-domain GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~mips ~ppc ~ppc64 ~x86 ~amd64-linux ~x86-linux ~ppc-macos"
IUSE=""
RESTRICT="test"

DOCS="AUTHORS ChangeLog FILEFORMAT NEWS README TODO"

src_prepare() {
    eapply_user
    eautoreconf
}
