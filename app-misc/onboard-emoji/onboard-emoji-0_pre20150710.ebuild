# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

myCommit="47314d5aff654d8e315552fb106cf82508915747"

DESCRIPTION="Emoji OnBoard keyboard layout"
HOMEPAGE="https://github.com/qnub/onboard-emoji"
SRC_URI="https://github.com/qnub/${PN}/archive/${myCommit}.zip -> ${P}-${myCommit}.zip"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
RDEPEND="dev-lang/python:2.7
	app-accessibility/onboard"

S="${WORKDIR}/${PN}-${myCommit}"

src_compile() {
	./gen_layout.py
}

src_install() {
	insinto /usr/share/onboard/layouts/
	doins -r layout/*
}
