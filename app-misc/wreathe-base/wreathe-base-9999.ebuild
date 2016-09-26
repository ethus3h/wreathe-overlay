# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="6"

inherit git-r3

DESCRIPTION="Wreathe"
HOMEPAGE="https://futuramerlin.com/"
EGIT_REPO_URI="git://github.com/ethus3h/wreathe.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 -*"
RDEPEND="app-misc/wreathe-backgrounds
app-misc/wreathe-typefaces-redist
app-misc/wreathe-typeface-family
app-misc/wreathe-office-resources
app-misc/crystallise
app-misc/wreathe-media-resources
x11-plugins/compiz-extra-snowflake-textures"

src_install() {
    insinto /
    GLOBIGNORE="README.md:.git"
    doins -r *
    unset GLOBIGNORE
}
