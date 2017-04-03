# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="The Unicode Standard: Character Database"
HOMEPAGE="http://www.unicode.org/"
SRC_URI="
	http://www.unicode.org/Public/${PV}/ReadMe.txt -> ${P}-ReadMe.txt
	http://www.unicode.org/Public/${PV}/${PN}/UCD.zip -> ${P}-UCD.zip
	http://www.unicode.org/Public/${PV}/${PN}/Unihan.zip -> ${P}-Unihan.zip
	http://www.unicode.org/Public/${PV}/${PN}xml/${PN}xml.readme.txt -> ${P}-${PN}xml.readme.txt
	http://www.unicode.org/Public/${PV}/${PN}xml/${PN}.all.flat.zip -> ${P}-${PN}.all.flat.zip
	http://www.unicode.org/Public/${PV}/${PN}xml/${PN}.all.grouped.zip -> ${P}-${PN}.all.grouped.zip
	"

LICENSE="freedist"
SLOT="${PV}"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86 ~amd64-linux ~x86-linux ~ppc-macos"
IUSE=""

S="${WORKDIR}"

src_unpack() {
	default
	cd "${DISTDIR}" || die
	for file in "${P}"-*.txt; do
		cp "$file" "${WORKDIR}"/"${file#$P-}"
	done
}

src_install() {
	insinto "/usr/share/unicode/${PN}/${PV}"
	doins *
}
