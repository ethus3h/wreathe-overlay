# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="6"

inherit git-r3

DESCRIPTION="BeHeMMOth bullet hell MMO game"
HOMEPAGE="https://futuramerlin.com/"
EGIT_REPO_URI="git://github.com/ethus3h/BeHeMMOth.git"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64 -*"
RDEPEND="www-plugins/gnash
    dev-lang/mono"
DEPEND="${RDEPEND}"

src_install() {
    insinto /Wreathe/Apps/BeHeMMOth/
    GLOBIGNORE="README.md:.git"
    doins -r *
    unset GLOBIGNORE
    exeinto /usr/bin/
    doexe behemmoth_client behemmoth_server
}
