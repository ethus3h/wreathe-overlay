# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python3_{5,6} )

inherit distutils-r1

MY_PV="${PV//_pre/.dev}"
MY_P="${PN}-${MY_PV}"
DESCRIPTION="Easy configuration as code tool for GitLab using config in plain YAML"
HOMEPAGE="https://github.com/egnyte/gitlabform"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${MY_P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc test"

RDEPEND="dev-python/requests[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]
	doc? ( dev-python/pypandoc[${PYTHON_USEDEP}] )
	test? ( dev-python/pytest[${PYTHON_USEDEP}] )"

DEPEND="${RDEPEND}"

S="${WORKDIR}/${MY_P}"
