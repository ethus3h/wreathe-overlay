# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="6"

inherit git-r3

DESCRIPTION="Gentoo historic ebuilds (doesn't install anything, but adds repo to distfiles)"
HOMEPAGE="https://gentoo.org/"
EGIT_REPO_URI="https://github.com/gentoo/gentoo-gitmig-20150809-draft.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""

src_unpack() {
	echo "(nothing to do)"
	mkdir "${S}"
}
