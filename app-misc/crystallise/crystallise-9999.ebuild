# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="6"

inherit git-r3

DESCRIPTION="Crystallise"
HOMEPAGE="https://futuramerlin.com/"
EGIT_REPO_URI="git://github.com/ethus3h/crystallise.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 -*"
RDEPEND="app-misc/wreathe-base
    dev-python/internetarchive"

src_install() {
    exeinto /usr/bin/
    GLOBIGNORE="README.md:.git"
    doexe *
    unset GLOBIGNORE
}
