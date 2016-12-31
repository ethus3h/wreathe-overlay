# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$
EAPI="3"
TRINITY_MODULE_TYPE="applications"

inherit trinity-meta autotools

DESCRIPTION="Image viewer for TDE"
KEYWORDS=
IUSE=""

RDEPEND="trinity-base/tdelibs
	trinity-base/tdegraphics-meta
	dev-qt/tqt"
DEPEND="${RDEPEND}"

pkg_setup() {
	export QTDIR="/usr/tqt3"
	export QTINC="/usr/include/tqt/Qt"
}

src_prepare() {
	eautoreconf
}

src_configure() {
	${S}/configure.gnu
}
