# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="6"

inherit git-r3

DESCRIPTION="Futuramerlin Web Toolkit"
HOMEPAGE="https://futuramerlin.com/"
EGIT_REPO_URI="git://github.com/ethus3h/futuramerlin-web-toolkit.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 -*"
RDEPEND="app-misc/wreathe-base"

src_install() {
    exeinto /usr/bin/
    doexe futuramerlin-web-toolkit-build
    doexe futuramerlin-web-toolkit-aliases
}
