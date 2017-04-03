# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="The Unicode Standard: Character Database"
HOMEPAGE="http://www.unicode.org/"
SRC_URI="
	http://www.unicode.org/Public/9.0.0/ReadMe.txt
	http://www.unicode.org/Public/9.0.0/ucd/UCD.zip
	http://www.unicode.org/Public/9.0.0/ucd/Unihan.zip
	http://www.unicode.org/Public/9.0.0/ucdxml/ucdxml.readme.txt
	http://www.unicode.org/Public/9.0.0/ucdxml/ucd.all.flat.zip
	http://www.unicode.org/Public/9.0.0/ucdxml/ucd.all.grouped.zip
	"

LICENSE="freedist"
SLOT="${PV}"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86 ~amd64-linux ~x86-linux ~ppc-macos"
IUSE=""

S="${WORKDIR}"

src_prepare() {
	for file in "${P}"-*; do
		mv "$file" "${file#$P}"
	done
}

src_install() {
	insinto "/usr/share/unicode/${PN}/${PV}"
	doins *
}
