# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="6"

inherit git-r3

DESCRIPTION="The Ember Information Technology Environment"
HOMEPAGE="https://futuramerlin.com/"
EGIT_REPO_URI="git://github.com/ethus3h/ember-information-technology-environment.git"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64 -*"
RDEPEND="app-misc/wreathe-meta
    dev-lang/nqp"
DEPEND="${RDEPEND}"

src_install() {
    insinto /Wreathe/
    GLOBIGNORE="README.md:.git"
    doins -r *
    unset GLOBIGNORE
}
