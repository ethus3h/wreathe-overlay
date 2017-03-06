# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

PYTHON_COMPAT=( python{2_7,3_4,3_5} )

inherit distutils-r1

DESCRIPTION="Sort-friendly URI Reordering Transform (SURT) Python package."
HOMEPAGE="https://github.com/internetarchive/surt"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="doc test"

RDEPEND="dev-lang/python:=
	dev-python/six
	>=dev-python/tldextract-2.0
	test? ( dev-python/pytest dev-python/pytest-cov )"

DEPEND="${RDEPEND}"
