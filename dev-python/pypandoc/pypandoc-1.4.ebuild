# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 python3_{4,5,6} )

inherit distutils-r1

MY_PV="${PV//_pre/.dev}"
MY_P="${PN}-${MY_PV}"
DESCRIPTION="Thin wrapper for \"pandoc\" (MIT)"
HOMEPAGE="https://github.com/bebraw/pypandoc"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${MY_P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc test"

RDEPEND="app-text/pandoc
	dev-python/setuptools[${PYTHON_USEDEP}]
	dev-python/pip[${PYTHON_USEDEP}]
	dev-python/wheel[${PYTHON_USEDEP}]"

DEPEND="${RDEPEND}"

S="${WORKDIR}/${MY_P}"
