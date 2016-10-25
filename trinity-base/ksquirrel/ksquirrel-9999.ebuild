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
    trinity-base/tdegraphics-meta"
DEPEND="${RDEPEND}"

pkg_setup() {
    use tqt && export QTDIR="/usr/tqt3"
    use tqt && export QTINC="/usr/include/tqt"
}

src_prepare() {
    eautoreconf
}

src_configure() {
    ${S}/configure.gnu
}
