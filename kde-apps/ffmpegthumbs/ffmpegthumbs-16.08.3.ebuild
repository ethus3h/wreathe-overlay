# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit kde4-base

DESCRIPTION="FFmpeg based thumbnail generator for video files"
SRC_URI="mirror://kde/Attic/applications/${PV}/src/${P}.tar.xz"

KEYWORDS="~amd64 ~x86"
IUSE="debug"

DEPEND="
	virtual/ffmpeg
"
RDEPEND="${DEPEND}
	$(add_kdeapps_dep kdebase-kioslaves)
"

src_install() {
	kde4-base_src_install
	rm -r "${ED}/usr/lib64/qt5" || die
	rm -r "${ED}/usr/share/kservices5" || die
}