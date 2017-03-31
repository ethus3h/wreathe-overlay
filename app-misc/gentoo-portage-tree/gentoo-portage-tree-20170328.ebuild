# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

myCommit="eebf7055e42fe7a248836e471ee11d264c73e42a"
DESCRIPTION="Official Gentoo ebuild repository"
HOMEPAGE="https://gentoo.org/"
SRC_URI="https://gitweb.gentoo.org/repo/gentoo.git/snapshot/gentoo-${myCommit}.tar.bz2 -> ${P}-${myCommit}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
DEPEND="dev-vcs/git"

S="${WORKDIR}/gentoo-${myCommit}"

src_install() {
	# FIXME: Remove all ebuilds for non-libre software
	insinto /usr/portage/
	GLOBIGNORE=".git"
	doins -r *
	unset GLOBIGNORE
}
