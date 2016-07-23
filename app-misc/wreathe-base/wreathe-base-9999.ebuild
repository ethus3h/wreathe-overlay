# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="6"

inherit git-r3

DESCRIPTION="Wreathe"
HOMEPAGE="https://futuramerlin.com/"
EGIT_REPO_URI="git://github.com/ethus3h/ember.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 -*"
RDEPEND=""

src_install() {
    insinto /
    doins -r "ember-satellite-projects/wreathe/*"
}


