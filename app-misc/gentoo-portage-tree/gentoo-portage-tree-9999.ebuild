# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2


EAPI="6"

inherit git-r3

DESCRIPTION="Official Gentoo ebuild repository"
HOMEPAGE="https://gentoo.org/"
EGIT_REPO_URI="git://anongit.gentoo.org/repo/gentoo.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
DEPEND="dev-vcs/git"

src_install() {
	insinto /usr/portage/
	GLOBIGNORE=".git"
	doins -r *
	unset GLOBIGNORE
}
