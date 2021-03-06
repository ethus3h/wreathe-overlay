# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python{2_7,3_4,3_5} )
inherit git-r3 distutils-r1

DESCRIPTION="a deviantArt image downloader script written in Python."
HOMEPAGE="https://github.com/voyageur/dagr"
EGIT_REPO_URI="https://github.com/voyageur/dagr.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND="dev-python/robobrowser[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}"
