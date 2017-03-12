# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

inherit git-r3

DESCRIPTION="Kernel for Wreathe"
HOMEPAGE="https://futuramerlin.com/"
EGIT_REPO_URI="git://github.com/ethus3h/wreathe-kernel.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 -*"

#TODO make this actually compile the gentoo-sources
src_install() {
	insinto /usr/src/linux/
	GLOBIGNORE="README.md:.git"
	doins -r *
	unset GLOBIGNORE
}
