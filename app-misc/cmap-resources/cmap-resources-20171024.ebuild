# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="CMap Resources"
HOMEPAGE="https://github.com/adobe-type-tools/cmap-resources"
SRC_URI="https://github.com/adobe-type-tools/cmap-resources/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"

src_compile() {
	# Access violations occur otherwise
	true
}
