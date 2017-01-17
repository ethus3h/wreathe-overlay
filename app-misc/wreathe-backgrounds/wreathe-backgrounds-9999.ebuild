# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="6"

inherit git-r3

DESCRIPTION="Backgrounds for Wreathe"
HOMEPAGE="https://futuramerlin.com/"
EGIT_REPO_URI="git://github.com/ethus3h/wreathe-backgrounds.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
RDEPEND="app-misc/wreathe-base"

src_install() {
	insinto /Wreathe/
	GLOBIGNORE="README.md:.git:.egup.tags:Themes"
	doins -r *
	unset GLOBIGNORE
	insinto /usr/share/wallpapers/
	doins -r Themes/*
}
