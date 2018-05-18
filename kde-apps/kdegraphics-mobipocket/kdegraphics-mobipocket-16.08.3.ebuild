# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit kde4-base

DESCRIPTION="Library to support mobipocket ebooks"
KEYWORDS="amd64 ~arm x86"
IUSE="debug"
SLOT="4.14"

src_configure() {
	# Put it in a separate path to avoid file collisions
	#-DCMAKE_INSTALL_PREFIX:PATH=/usr/kde4
	local mycmakeargs=(
		-DCMAKE_DISABLE_FIND_PACKAGE_Strigi=ON
	)

	kde4-base_src_configure
}
