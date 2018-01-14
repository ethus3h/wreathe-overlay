# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 python3_{4,5,6} )

inherit distutils-r1

DESCRIPTION="Certificate Authority for MITM proxies"
HOMEPAGE="https://github.com/ikreymer/certauth"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc test"

RDEPEND="dev-python/pyopenssl[${PYTHON_USEDEP}]"

DEPEND="${RDEPEND}
	test? ( dev-python/pytest[${PYTHON_USEDEP}] dev-python/pytest-cov[${PYTHON_USEDEP}] )"
