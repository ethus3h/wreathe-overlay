# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 python3_{4,5,6} )

inherit distutils-r1

DESCRIPTION="Rudimentary rethinkdb python library (newer versions renamed to doublethink)"
HOMEPAGE="https://github.com/nlevitt/rethinkstuff"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="dev-python/python-rethinkdb[${PYTHON_USEDEP}]"

DEPEND="${RDEPEND}"
