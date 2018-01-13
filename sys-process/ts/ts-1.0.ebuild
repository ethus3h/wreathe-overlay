# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit toolchain-funcs

DESCRIPTION="TaskSpooler is a comfortable way of running batch jobs"
HOMEPAGE="http://vicerveza.homeunix.net/~viric/soft/ts/"
SRC_URI="http://vicerveza.homeunix.net/~viric/soft/ts/${P}.tar.gz"
LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64 ~x86"

src_unpack() {
	unpack ${A}
	cd "${S}"

	sed -i \
		-e 's|CFLAGS=|CFLAGS+=|' \
		-e 's|-g -O0||' \
		Makefile || die "sed failed"
}

src_compile() {
	emake CC=$(tc-getCC) || die "emake failed"
}

src_install() {
	exeinto /usr/bin
	mv ts tsp
	doexe tsp
	mv ts.1 tsp.1
	doman tsp.1
	dodoc Changelog OBJECTIVES PORTABILITY PROTOCOL README TRICKS
}

src_test() {
	PATH="${D}/usr/bin:${PATH}" ./testbench.sh || die "tests failed"
}
