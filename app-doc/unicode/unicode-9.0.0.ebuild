# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="The Unicode Standard"
HOMEPAGE="http://www.unicode.org/"
SRC_URI="
	http://www.unicode.org/versions/Unicode${PV}/ -> ${P}-index.htm
	http://www.unicode.org/versions/Unicode${PV}/UnicodeStandard-9.0.pdf
	http://www.unicode.org/Public/${PV}/charts/CodeCharts.pdf -> ${P}-CodeCharts.pdf
	http://www.unicode.org/versions/IICoreRSIndex.pdf
	http://www.unicode.org/Public/8.0.0/charts/RSIndex.pdf -> ${P}-RSIndex.pdf
	http://www.unicode.org/versions/components-${PV}.html -> ${P}-components-${PV}.html
	http://web.archive.org/web/20170403091500/http://www.unicode.org/glossary/ -> ${P}-glossary.htm
	"

LICENSE="freedist"
SLOT="${PV}"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86 ~amd64-linux ~x86-linux ~ppc-macos"
IUSE=""

DEPEND="app-doc/emoji:4.0
	app-doc/ucd:${PV}"

S="${WORKDIR}"

src_unpack() {
	cd "${DISTDIR}" || die
	for file in "${P}"-*; do
		cp "$file" "${WORKDIR}"/"${file#$P-}"
	done
}

src_install() {
	insinto "/usr/share/${PN}/${PV}"
	doins *
}
