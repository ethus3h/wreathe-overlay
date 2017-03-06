# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

PYTHON_COMPAT=( python{2_7,3_4,3_5} )

inherit distutils-r1

MY_PV="${PV//_pre/.dev}"
MY_P="${PN}-${MY_PV}"
DESCRIPTION="RethinkDB python library. Provides connection manager and ORM framework."
HOMEPAGE="https://github.com/internetarchive/doublethink"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${MY_P}.tar.gz"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc test"

RDEPEND="dev-lang/python:=
	dev-python/python-rethinkdb"

DEPEND="${RDEPEND}"

S="${WORKDIR}/${MY_P}"
