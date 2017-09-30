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
	perl6 -Ilib bin/zef install --force-test .
}

src_install() {
	false
}
