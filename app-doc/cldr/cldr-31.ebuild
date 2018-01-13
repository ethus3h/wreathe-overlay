# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Unicode Common Locale Data Repository"
HOMEPAGE="http://www.unicode.org/"
SRC_URI="
	http://www.unicode.org/reports/tr35/tr35-47/tr35.html -> ${P}-tr35.html
	http://unicode.org/Public/${PN}/${PV}/core.zip -> ${P}-core.zip
	http://unicode.org/Public/${PN}/${PV}/keyboards.zip -> ${P}-keyboards.zip
	http://unicode.org/Public/${PN}/${PV}/tools.zip -> ${P}-tools.zip
	"

LICENSE="freedist"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86 ~amd64-linux ~x86-linux ~ppc-macos"

S="${WORKDIR}"

src_unpack() {
	default
	cd "${DISTDIR}" || die
	for file in "${P}"-*.html; do
		cp "$file" "${WORKDIR}"/"${file#$P-}"
	done
}

src_install() {
	insinto "/usr/share/unicode/${PN}/${PV}"
	doins -r *
}
