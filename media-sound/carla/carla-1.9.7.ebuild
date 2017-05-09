# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

PYTHON_COMPAT=( python{3_4,3_5} )

inherit python-r1

DESCRIPTION="Audio plugin host and sampler"
HOMEPAGE="https://github.com/falkTX/Carla"
SRC_URI="https://github.com/falkTX/Carla/archive/1.9.7.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2 LGPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/PyQt4[${PYTHON_USEDEP}]
	media-libs/liblo
"
RDEPEND="${DEPEND}"
S="${WORKDIR}/${P^}"
