# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

DESCRIPTION="Futuramerlin Web Toolkit"
HOMEPAGE="https://futuramerlin.com/"
SRC_URI="https://github.com/ethus3h/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="AGPL-3 GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
RDEPEND="app-misc/wreathe-base"

pkg_preinst() {
	#Remove the temporary install prefix from scripts where it has been copied
	tempdir="${D}"
	export tempdir
	tempdirEsc="$(perl -0777 -e 'print(quotemeta($ENV{tempdir}))')"
	find "$tempdir" -type f -exec perl -0777 -p -i -e "s/$tempdirEsc/\//g" {} \;
}

src_install() {
	default
	insinto /
	doins support/assets/m.css
}
