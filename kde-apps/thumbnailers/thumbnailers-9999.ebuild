# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

#This is a virtual package to allow installation of Plasma 5 metapackages with KDE SC 4's Dolphin
DESCRIPTION="KDE 4 thumbnail generators for PDF/PS files"
HOMEPAGE="https://github.com/KDE/thumbnailers"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""

DEPEND="
	kde-apps/thumbnailers:4
"
RDEPEND="${DEPEND}"
PDEPEND="${DEPEND}"
