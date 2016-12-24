# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

#This is a virtual package to allow installation of Plasma 5 metapackages with KDE SC 4's Dolphin
DESCRIPTION="A KDE filemanager focusing on usability"
HOMEPAGE="https://github.com/KDE/dolphin"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ~arm ppc ~ppc64 x86 ~amd64-linux ~x86-linux"

DEPEND="
	kde-apps/dolphin:4
"
RDEPEND="${DEPEND}"
PDEPEND="${DEPEND}"
