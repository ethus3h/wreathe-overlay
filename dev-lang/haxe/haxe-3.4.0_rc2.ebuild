# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit eutils

DESCRIPTION="Haxe programming language"
HOMEPAGE="http://haxe.org/"
SRC_URI="https://github.com/HaxeFoundation/${PN}/archive/${PV/_/-}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2 LGPL-2.1 BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+neko"

RDEPEND="neko? ( >=dev-lang/neko-2.1.0 )"
DEPEND="${RDEPEND}
		dev-lang/ocaml[ocamlopt]
		sys-libs/zlib"

MAKEOPTS+=" -j1"

src_prepare() {
	epatch "${FILESDIR}"/haxe-3.0-install.patch
}

src_install() {
	default_src_install
	doenvd "${FILESDIR}"/99haxe
}
