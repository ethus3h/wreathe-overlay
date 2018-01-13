# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

myCommit="4be757090c3ac07608eb278baba3cc71cf835c03"

DESCRIPTION="Mapping Resources for PDF"
HOMEPAGE="https://github.com/adobe-type-tools/mapping-resources-pdf"
SRC_URI="https://github.com/adobe-type-tools/${PN}/archive/${myCommit}.zip -> ${P}-${myCommit}.zip"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"

S="${WORKDIR}/${PN}-${myCommit}"

src_compile() {
	# Access violations (probably) occur otherwise (like in cmap-resources)
	true
}
