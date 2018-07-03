# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

KMNAME="kde4-baseapps"

inherit cmake-utils kde4-meta

baseappsVersion="4.7.4"
DESCRIPTION="A KDE filemanager focusing on usability"
HOMEPAGE="https://futuramerlin.com/"
SRC_URI="mirror://kde/Attic/${baseappsVersion}/src/kde-baseapps-${baseappsVersion}.tar.bz2
	https://github.com/ethus3h/wreathe-file-manager/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="4"
KEYWORDS="~amd64"
IUSE="debug semantic-desktop thumbnail"

DEPEND="kde-frameworks/kdelibs:4
	kde-apps/libkonq:4
	semantic-desktop? ( kde-frameworks/nepomuk )
	thumbnail? ( || ( kde-apps/thumbnailers:4 ) || ( kde-apps/ffmpegthumbs:4 kde-apps/mplayerthumbs:4 ) )
	kde-apps/kfind
	kde-frameworks/kio
	kde-apps/kio-extras
	media-gfx/icoutils
	app-misc/strigi
	app-misc/wreathe-base"

RDEPEND="${DEPEND}"
PDEPEND="${DEPEND}"

RESTRICT="test"
# bug 393129

S="${WORKDIR}/kde-baseapps-${baseappsVersion}"

src_unpack() {
	default_src_unpack
	rm -rv "${WORKDIR}/kde-baseapps-${baseappsVersion}/${PN}"
	rsync -av --checksum --progress "${WORKDIR}/wreathe-file-manager-${PV}/" "${WORKDIR}/kde-baseapps-${baseappsVersion}/${PN}"
}

src_install() {
	kde4-meta_src_install
	dosym /usr/kde4/bin/dolphin /usr/bin/dolphin4
}
