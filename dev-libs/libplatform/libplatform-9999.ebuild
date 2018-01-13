# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3 cmake-utils

MY_PN="platform"

EGIT_REPO_URI="https://github.com/Pulse-Eight/${MY_PN}.git"
EGIT_BRANCH="master"

DESCRIPTION="Platform support library used by libCEC and binary add-ons for Kodi."
HOMEPAGE="https://github.com/Pulse-Eight/platform"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~arm ~amd64 ~x86"

src_configure() {
	local mycmakeargs=(
		-DBUILD_SHARED_LIBS=1
	)
	cmake-utils_src_configure
}
