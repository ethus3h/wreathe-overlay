# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 python3_{4,5,6} )

inherit distutils-r1

DESCRIPTION="WARC writing intercepting HTTP/S proxy"
HOMEPAGE="https://github.com/internetarchive/warcprox"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc test"

RDEPEND="dev-python/certauth[${PYTHON_USEDEP}]
	dev-python/warctools[${PYTHON_USEDEP}]
	dev-python/urlcanon[${PYTHON_USEDEP}]
	dev-python/doublethink[${PYTHON_USEDEP}]
	dev-python/urllib3[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/PySocks[${PYTHON_USEDEP}]
	dev-python/cryptography[${PYTHON_USEDEP}]"

DEPEND="${RDEPEND}"
