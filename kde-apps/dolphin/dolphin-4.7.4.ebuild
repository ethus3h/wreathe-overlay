# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

KMNAME="kde4-baseapps"

inherit cmake-utils kde4-meta git-r3

DESCRIPTION="A KDE filemanager focusing on usability"
HOMEPAGE="https://github.com/KDE/dolphin/releases/tag/v4.7.4"
SRC_URI="http://download.kde.org/Attic/4.7.4/src/kde-baseapps-4.7.4.tar.bz2"
EGIT_REPO_URI="git://github.com/ethus3h/wreathe-file-manager.git"

LICENSE="GPL-2"
SLOT="4"
KEYWORDS="~amd64 -*"
IUSE="debug semantic-desktop thumbnail"

DEPEND="kde-frameworks/kdelibs:4
	kde-apps/libkonq:4
	semantic-desktop? ( kde-frameworks/nepomuk )
	thumbnail? ( || ( kde-apps/thumbnailers:4 ) || ( kde-apps/ffmpegthumbs:4 kde-apps/mplayerthumbs:4 ) )
	kde-apps/kfind:=
	media-gfx/icoutils
	app-misc/strigi
	app-misc/wreathe-base"

RDEPEND="${DEPEND}"
PDEPEND="${DEPEND}"

RESTRICT="test"
# bug 393129

S="${WORKDIR}/kde-baseapps-4.7.4"

src_unpack() {
	default_src_unpack
	git-r3_src_unpack
	rsync -av --progress "${WORKDIR}/${P}" "${WORKDIR}/kde-baseapps-${PV}/${P}"
}
