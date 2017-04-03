# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="The Unicode Standard: Docments"

# This packages the contents of:
# 	http://www.unicode.org/reports/
# 	http://www.unicode.org/notes/
# 	http://www.unicode.org/history/
# 	http://ftp.unicode.org/Public/ (minus code charts)

HOMEPAGE="http://www.unicode.org/"
SRC_URI="
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
