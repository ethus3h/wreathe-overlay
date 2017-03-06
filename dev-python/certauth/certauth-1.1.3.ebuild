# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

PYTHON_COMPAT=( python{2_7,3_4,3_5} )

inherit distutils-r1

DESCRIPTION="Certificate Authority for MITM proxies"
HOMEPAGE="https://github.com/ikreymer/certauth"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc test"

RDEPEND="dev-lang/python:=
	dev-python/pyopenssl
	test? ( dev-python/pytest dev-python/pytest-cov )"

DEPEND="${RDEPEND}"
