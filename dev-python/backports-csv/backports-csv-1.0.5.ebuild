# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 python3_{4,5,6} )

inherit distutils-r1
MY_PN="${PN/-/.}"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Certificate Authority for MITM proxies"
HOMEPAGE="https://github.com/ryanhiebert/backports.csv"
SRC_URI="mirror://pypi/${PN:0:1}/${MY_PN}/${MY_P}.tar.gz"

LICENSE="PSF-2"
SLOT="0"

KEYWORDS="~amd64 ~x86"
IUSE="doc test"

S="${WORKDIR}/${MY_P}"

RDEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"

DEPEND="${RDEPEND}"
