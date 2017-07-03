# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python{2_7,3_4,3_5} )

inherit distutils-r1

DESCRIPTION="A python interface to archive.org."
HOMEPAGE="https://github.com/jjjake/internetarchive"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc test"

RDEPEND="dev-python/requests[${PYTHON_USEDEP}]
	dev-python/jsonpatch
	dev-python/docopt
	dev-python/clint
	dev-python/six
	dev-python/schema
	dev-python/backports-csv"

DEPEND="${RDEPEND}"
