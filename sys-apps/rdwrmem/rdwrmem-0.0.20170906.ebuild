# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Command line and script access directly to I/O ports on PC hardware"
HOMEPAGE="https://people.redhat.com/~rjones/ioport/"
SRC_URI="https://web.archive.org/web/20170906162327if_/http://cmp.felk.cvut.cz/~pisa/linux/${PN}.c"

LICENSE="BSD" # "any combination GPL, LGPL, MPL or BSD licenses"
KEYWORDS="~amd64 ~x86"
SLOT="0"

src_unpack() {
	mkdir -p "${S}"
	mv "${DISTDIR}" "${S}"
}

src_compile() {
	cc rdwrmem.c
}

src_install() {
	doins rdwrmem.c
}
