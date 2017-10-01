# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Perl 6 module installer"
HOMEPAGE="https://github.com/ugexe/zef"
SRC_URI="https://github.com/ugexe/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
KEYWORDS="~amd64 ~x86"
SLOT="0"

RDEPEND="virtual/perl6"
DEPEND="${RDEPEND}"

src_compile() {
	mkdir -p "../usr/share/perl6/site"
	perl6 -Ilib bin/zef --force-test --to="../usr/share/perl6/site" install .
	rm "../usr/share/perl6/site/version"
}

src_install() {
	insinto "/usr/share/perl6/"
	doins -r "../usr/share/perl6/site"
	for filename in ../usr/share/perl6/site/bin/*; do
		[[ -e "$filename" ]] || continue
		linkname="$(basename "$filename")"
		dosym "${EPREFIX}/usr/share/perl6/site/bin/$linkname" "${EPREFIX}/usr/bin/$linkname"
		fperms +x "/usr/share/perl6/site/bin/$linkname"
		#fperms +x "/usr/bin/$linkname"
	done
}
