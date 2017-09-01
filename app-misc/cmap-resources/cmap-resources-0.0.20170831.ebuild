# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

inherit git-r3
myCommit="99cd37a672fef82753817c3f48ac4146396791b7"

DESCRIPTION="CMap Resources"
HOMEPAGE="https://github.com/adobe-type-tools/cmap-resources"
SRC_URI="https://github.com/adobe-type-tools/${PN}/archive/${myCommit}.zip -> ${P}-${myCommit}.zip"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
