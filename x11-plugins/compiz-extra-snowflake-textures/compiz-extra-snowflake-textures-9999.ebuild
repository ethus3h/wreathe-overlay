# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

inherit git-r3

DESCRIPTION="Extra snowflake textures for Compiz"
HOMEPAGE="https://futuramerlin.com/"
EGIT_REPO_URI="git://github.com/ethus3h/compiz-extra-snowflake-textures.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 -*"
# FIXME: x11-plugins/compiz-plugins-experimental provided by wreathe-base
RDEPEND="app-misc/wreathe-base"

src_install() {
	insinto /usr/share/compiz/snow/
	GLOBIGNORE="README.md:.git:.egup.tags"
	doins -r *
	unset GLOBIGNORE
}
