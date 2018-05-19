# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

#This is a virtual package to allow installation of Plasma 5 KFind with KDE SC 4's Dolphin
DESCRIPTION="File finder utility based on KDE Frameworks"
HOMEPAGE="https://www.kde.org/applications/utilities/kfind/"

LICENSE="GPL-2"
SLOT="4"
KEYWORDS="~amd64 ~x86"

DEPEND="
	kde-apps/kfind
"
RDEPEND="${DEPEND}"
PDEPEND="${DEPEND}"
