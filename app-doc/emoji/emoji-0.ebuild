# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="The Unicode Standard: Emoji data: Metapackage"
HOMEPAGE="http://www.unicode.org/"

LICENSE="freedist"
SLOT="${PV}"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86 ~amd64-linux ~x86-linux ~ppc-macos"

RDEPEND="app-doc/emoji:1.0
	app-doc/emoji:2.0
	app-doc/emoji:3.0
	app-doc/emoji:4.0
	app-doc/emoji:5.0"

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
