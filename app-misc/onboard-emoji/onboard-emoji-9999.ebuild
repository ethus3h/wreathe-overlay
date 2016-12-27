# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="6"

inherit git-r3

DESCRIPTION="Emoji OnBoard keyboard layout"
HOMEPAGE="https://github.com/qnub/onboard-emoji"
EGIT_REPO_URI="git://github.com/qnub/onboard-emoji.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 -*"
RDEPEND="dev-lang/python:2.7
    app-accessibility/onboard"

src_compile() {
    ./gen_layout.py
}
src_install() {
    insinto /usr/share/onboard/layouts/
    doins -r layout/*
}
