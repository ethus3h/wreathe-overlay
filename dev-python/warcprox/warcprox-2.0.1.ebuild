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

RDEPEND="dev-lang/python:=
	>=dev-python/certauth-1.1.0
	dev-python/warctools
	>=dev-python/kafka-python-1.0.1
	>=dev-python/surt-0.3
	dev-python/rethinkstuff
	>=dev-python/doublethink-0.2.0_pre69"

DEPEND="${RDEPEND}"
