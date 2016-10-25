# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$
EAPI="3"
TRINITY_MODULE_TYPE="applications"
WANT_AUTOCONF="2.6"

inherit trinity-meta autotools

DESCRIPTION="Image viewer for TDE"
KEYWORDS=
IUSE=""

RDEPEND="trinity-base/tdelibs
    trinity-base/tdegraphics-meta"
DEPEND="${RDEPEND}"

src_configure() {
	eautoconf ${S}/configure.in
    ${S}/configure.gnu
}
