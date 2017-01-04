# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

# TODO: Add support for sqlite, mysql, gtk, and apache modules.

EAPI=6
inherit eutils

DESCRIPTION="Neko programming language compiler, virtual machine, and libraries."
HOMEPAGE="http://nekovm.org/"
SRC_URI="https://github.com/HaxeFoundation/${PN}/archive/v2-1-0.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="dev-libs/boehm-gc[threads]
		dev-libs/libpcre:3
		sys-libs/zlib"
RDEPEND="${DEPEND}"

MAKEOPTS+=" -j1"

src_prepare() {
	epatch "${FILESDIR}"/neko-2.0.0-install.patch
}
