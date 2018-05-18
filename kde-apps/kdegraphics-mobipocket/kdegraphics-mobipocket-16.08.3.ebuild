# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

KMNAME="kde-apps"
KMMODULE="kdegraphics-mobipocket"
inherit kde4-base

DESCRIPTION="Library to support mobipocket ebooks"
KEYWORDS="~amd64 ~x86"
SRC_URI="http://ftp.ntu.edu.tw/kde/stable/applications/16.08.3/src/kdegraphics-mobipocket-16.08.3.tar.xz"
IUSE="debug"
SLOT="4.14"

src_configure() {
	# Put it in a separate path to avoid file collisions
	local mycmakeargs=(
		-DCMAKE_INSTALL_PREFIX:PATH=/usr/kde4
		-DCMAKE_DISABLE_FIND_PACKAGE_Strigi=ON
	)

	kde4-base_src_configure
}
