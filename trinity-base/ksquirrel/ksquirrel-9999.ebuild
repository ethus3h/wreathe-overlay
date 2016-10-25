# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$
EAPI="3"
TRINITY_MODULE_TYPE="applications"

inherit trinity-meta

DESCRIPTION="Image viewer for TDE"
KEYWORDS=
IUSE=""

RDEPEND="trinity-base/tdelibs
    trinity-base/tdegraphics-meta"
DEPEND="${RDEPEND}"

src_configure() {
	autoconf ${S}/configure.in
    ${S}/configure.gnu
}
