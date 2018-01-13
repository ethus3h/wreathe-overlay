# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="The Unicode Standard: Emoji data"
HOMEPAGE="http://www.unicode.org/"
SRC_URI="
	http://www.unicode.org/Public/${PN}/${PV}/ReadMe.txt -> ${P}-ReadMe.txt
	http://www.unicode.org/Public/${PN}/${PV}/emoji-data.txt -> ${P}-emoji-data.txt
	http://www.unicode.org/Public/${PN}/${PV}/emoji-sequences.txt -> ${P}-emoji-sequences.txt
	http://www.unicode.org/Public/${PN}/${PV}/emoji-test.txt -> ${P}-emoji-test.txt
	http://www.unicode.org/Public/${PN}/${PV}/emoji-zwj-sequences.txt -> ${P}-emoji-zwj-sequences.txt
	"

LICENSE="freedist"
SLOT="${PV}"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86 ~amd64-linux ~x86-linux ~ppc-macos"

S="${WORKDIR}"

src_unpack() {
	cd "${DISTDIR}" || die
	for file in "${P}"-*; do
		cp "$file" "${WORKDIR}"/"${file#$P-}"
	done
}

src_install() {
	insinto "/usr/share/unicode/${PN}/${PV}"
	doins *
}
