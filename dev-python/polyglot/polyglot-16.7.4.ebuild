# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python{2_7,3_5} )

inherit distutils-r1

DESCRIPTION="Natural language pipeline"
HOMEPAGE="https://pypi.python.org/pypi/polyglot"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc test"

RDEPEND="dev-libs/icu
	dev-python/wheel[${PYTHON_USEDEP}]
	dev-python/pyicu[${PYTHON_USEDEP}]
	dev-python/pycld2[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]
	dev-python/futures[${PYTHON_USEDEP}]
	dev-python/Morfessor[${PYTHON_USEDEP}]
	dev-python/numpy[${PYTHON_USEDEP}]"

DEPEND="${RDEPEND}"
