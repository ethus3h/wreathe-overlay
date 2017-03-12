# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

inherit git-r3
#java-pkg-2 java-pkg-simple

DESCRIPTION="List contents of RotMG-protocol bullet hell MMO accounts"
HOMEPAGE="https://github.com/atomizer/${PN}"
SRC_URI="https://github.com/atomizer/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 -*"
