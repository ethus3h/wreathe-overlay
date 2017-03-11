# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2


EAPI=6

#This is a virtual package to allow installation of Plasma 5 metapackages with KDE SC 4's Dolphin
DESCRIPTION="Extra Dolphin plugins"
HOMEPAGE="https://github.com/KDE/dolphin-plugins"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""

DEPEND="
	kde-apps/dolphin-plugins:4
"
RDEPEND="${DEPEND}"
PDEPEND="${DEPEND}"
