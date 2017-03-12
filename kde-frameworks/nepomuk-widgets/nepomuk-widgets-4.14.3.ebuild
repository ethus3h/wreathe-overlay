# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit kde4-base

DESCRIPTION="Widget library for nepomuk"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="debug"

DEPEND="
	kde-frameworks/nepomuk-core
	>=dev-libs/soprano-2.9.0
"
RDEPEND="${DEPEND}
	!<kde-frameworks/nepomuk-core-4.9.80:4
"

# tests hangs
RESTRICT="test"
