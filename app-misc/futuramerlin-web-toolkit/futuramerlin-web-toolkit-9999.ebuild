# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

inherit git-r3

DESCRIPTION="Futuramerlin Web Toolkit"
HOMEPAGE="https://futuramerlin.com/"
EGIT_REPO_URI="git://github.com/ethus3h/futuramerlin-web-toolkit.git"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS=""
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
