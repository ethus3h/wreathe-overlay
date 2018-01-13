# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
inherit font

DESCRIPTION="Bhutanese/Tibetan fonts for dzongkha script provided by the Bhutanese government"
HOMEPAGE="http://www.dit.gov.bt/downloads"
SRC_URI="http://www.dit.gov.bt/sites/default/files/dzongkhafonts.zip -> ${P}.zip
		http://http.debian.net/debian/pool/main/f/fonts-dzongkha/fonts-dzongkha_0.3.orig.tar.xz
		http://www.dzongkha.gov.bt/IT/download/DzongkhaFonts.zip -> extra-${P}.zip"

LICENSE="OFL"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="app-arch/unzip"

S="${WORKDIR}"
FONT_S="${S}"
FONT_SUFFIX="ttf vtp.gz"

src_unpack() {
	default
	unpack ./*.zip
	mv fonts-dzongkha-0.3/* .
	mv 'Dzongkha Fonts'/* .
	mv 'Druk Corners Font'/* .
}
