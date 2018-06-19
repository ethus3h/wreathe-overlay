# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 python3_{4,5,6} )

inherit distutils-r1

MY_PV="0.1.dev23"

DESCRIPTION="A URL canonicalization (normalization) library for Python and Java."
HOMEPAGE="https://github.com/iipc/urlcanon"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${PN}-${MY_PV}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc test"

RDEPEND="dev-python/idna[${PYTHON_USEDEP}]
	python_targets_python2_7? ( dev-python/ipaddress[${PYTHON_USEDEP}] )"

DEPEND="${RDEPEND}
	test? ( dev-python/pytest[${PYTHON_USEDEP}] )"

S="${WORKDIR}/${PN}-${MY_PV}"
