# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

myCommit="e3587ff73ed8161ee60c24a5fbfd432f63208664"
DESCRIPTION="Official Gentoo ebuild repository"
HOMEPAGE="https://gentoo.org/"
SRC_URI="https://gitweb.gentoo.org/repo/gentoo.git/snapshot/gentoo-${myCommit}.tar.bz2 -> ${P}-${myCommit}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

S="${WORKDIR}/gentoo-${myCommit}"

src_install() {
	# FIXME: Remove all ebuilds for non-libre software
	insinto /usr/portage/
	GLOBIGNORE=".git"
	doins -r *
	unset GLOBIGNORE
}
