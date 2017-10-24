# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python{2_7,3_4,3_5} )

inherit distutils-r1

DESCRIPTION="Python bindings for the Apache Thrift RPC system"
HOMEPAGE="https://pypi.python.org/pypi/thrift"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.zip"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="dev-lang/python[ssl]
	dev-python/backports-ssl-match-hostname[${PYTHON_USEDEP}]
	python_targets_python2_7? ( dev-python/ipaddress[python_targets_python2_7] )
	dev-python/six[${PYTHON_USEDEP}]
	dev-python/twisted[${PYTHON_USEDEP}]
	www-servers/tornado[${PYTHON_USEDEP}]"

DEPEND="${RDEPEND}"

S="${WORKDIR}/${P}"
