# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python{2_7,3_4,3_5} )

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
	dev-python/kafka-python[${PYTHON_USEDEP}]
	dev-python/surt[${PYTHON_USEDEP}]
	dev-python/rethinkstuff[${PYTHON_USEDEP}]
	dev-python/doublethink[${PYTHON_USEDEP}]"

DEPEND="${RDEPEND}"
