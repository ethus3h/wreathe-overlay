# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 python3_{4,5,6} )

inherit distutils-r1

MY_PV="${PV//_pre/.dev}"
MY_P="${PN}-${MY_PV}"

DESCRIPTION="A URL canonicalization (normalization) library for Python and Java."
HOMEPAGE="https://github.com/iipc/urlcanon"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${MY_P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc test"

RDEPEND="dev-python/idna[${PYTHON_USEDEP}]
	python_targets_python2_7? ( dev-python/ipaddress )"

DEPEND="${RDEPEND}
	test? ( dev-python/pytest[${PYTHON_USEDEP}] )"

S="${WORKDIR}/${MY_P}"
