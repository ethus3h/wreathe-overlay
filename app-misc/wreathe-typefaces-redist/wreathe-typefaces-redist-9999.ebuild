# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

inherit git-r3

DESCRIPTION="Redistributed typefaces package for Wreathe"
HOMEPAGE="https://futuramerlin.com/"
EGIT_REPO_URI="git://github.com/ethus3h/wreathe-typefaces-redist.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
RDEPEND="app-misc/wreathe-base"

src_install() {
	insinto /Wreathe/Typefaces/redist/
	GLOBIGNORE="README.md:.git:.egup.tags"
	doins -r *
	unset GLOBIGNORE
}
