# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="CMap Resources"
HOMEPAGE="https://github.com/adobe-type-tools/cmap-resources"
SRC_URI="https://github.com/adobe-type-tools/cmap-resources/archive/${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/adobe-type-tools/cmap-resources/releases/download/${PV}/UTF-32.pdf -> ${P}-UTF-32.pdf"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"

src_compile() {
	# Access violations occur otherwise
	true
}

src_install() {
	default
	cp "${DISTDIR}/${P}-UTF-32.pdf" "UTF-32.pdf" || die
	dodoc "UTF-32.pdf"
}
