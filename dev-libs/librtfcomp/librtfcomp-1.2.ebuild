# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 )

inherit python-r1

DESCRIPTION="Library for handling compressed RTF documents"
HOMEPAGE="https://sourceforge.net/projects/synce/"
SRC_URI="mirror://sourceforge/synce/${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="python static-libs"

RDEPEND="python? ( >=dev-python/pyrex-0.9.6 )"
DEPEND="${RDEPEND}"

DOCS="CHANGELOG"

pkg_setup() {
	if use python; then
		python_set_active_version 2
		python_pkg_setup
	fi
}

src_configure() {
	econf \
		$(use_enable static-libs static) \
		$(use_enable python python-bindings)
}

src_install() {
	default

	# prune_libtool_files() from eutils.eclass fails wrt #421197
	find "${ED}" -name '*.la' -exec rm -f {} +

	# Always remove static archive from site-packages
	use static-libs && find "${ED}" -name pyrtfcomp.a -exec rm -f {} +
}
