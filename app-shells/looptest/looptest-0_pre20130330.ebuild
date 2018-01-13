# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

myCommit="ee6db251ad05f773e09234386008abdc49671125"

DESCRIPTION="Loop iteration tester for use in osh(1) and sh6(1) scripting"
HOMEPAGE="http://v6shell.org/looptest/"
SRC_URI="https://github.com/JNeitzel/${PN}/archive/${myCommit}.zip -> ${P}-${myCommit}.zip"

LICENSE="BSD BSD-2 BSD-4"
SLOT="0"
KEYWORDS="~amd64 ~x86"

S="${WORKDIR}/${PN}-${myCommit}"
