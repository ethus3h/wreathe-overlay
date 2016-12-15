# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/kde-base/dolphin/Attic/dolphin-4.7.4.ebuild,v 1.5 2012/02/18 14:47:27 nixnut Exp $

EAPI=6

KMNAME="kde4-baseapps"

inherit cmake-utils kde4-meta

DESCRIPTION="A KDE filemanager focusing on usability"
HOMEPAGE="https://github.com/KDE/dolphin/releases/tag/v4.7.4"
SRC_URI="http://download.kde.org/Attic/4.7.4/src/kde-baseapps-4.7.4.tar.bz2"

LICENSE="GPL-2"
SLOT="4"
KEYWORDS="amd64 ~arm ppc ~ppc64 x86 ~amd64-linux ~x86-linux"
IUSE="debug semantic-desktop thumbnail"

DEPEND="
	kde-base/kdelibs:4
	kde-apps/libkonq:4
	semantic-desktop? ( kde-base/nepomuk )
	thumbnail? ( || ( kde-apps/thumbnailers4 kde-apps/thumbnailers:4 ) || ( kde-apps/ffmpegthumbs:4 kde-apps/mplayerthumbs:4 ) )
	kde-apps/kfind
	media-gfx/icoutils
	app-misc/strigi
	app-misc/wreathe-base
"
RDEPEND="${DEPEND}"
PDEPEND="${DEPEND}"

RESTRICT="test"
# bug 393129

S="${WORKDIR}/kde-baseapps-4.7.4"

src_unpack() {
	default_src_unpack
}
