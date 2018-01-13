# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit font

DESCRIPTION="Caladea font for Chrom*OS by Huerta Tipografia"
HOMEPAGE="https://directory.fsf.org/wiki/Crosextrafonts"
SRC_URI="http://commondatastorage.googleapis.com/chromeos-localmirror/distfiles/${P}.tar.gz"

LICENSE="OFL-1.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RESTRICT="test"

FONT_SUFFIX="ttf"
