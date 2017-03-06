# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

PYTHON_COMPAT=( python{2_7,3_4,3_5} )

inherit distutils-r1

DESCRIPTION="Command line tools and libraries for handling and manipulating WARC files"
HOMEPAGE="https://github.com/internetarchive/warctools"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc test"

RDEPEND="dev-lang/python:=
	dev-python/setuptools
	dev-python/unittest2
	test? ( dev-python/nose )"

DEPEND="${RDEPEND}"
