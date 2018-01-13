# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit autotools eutils

DESCRIPTION="An easily extensible archive format"
HOMEPAGE="https://github.com/KubaKaszycki/xar"
SRC_URI="https://archive.org/download/Liquid-20180113010553016165391_2d303530300aa2512d8b2b284876a18b744b426e04d4/xar-2.0.0_rc1.tar.xz -> ${P}.tar.xz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~hppa ~ia64 ~ppc ~ppc64 ~sparc ~x86 ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos"
IUSE="+bzip2 libressl"

DEPEND="
	!libressl? (
		dev-libs/openssl:0=
	)
	libressl? (
		dev-libs/libressl:0=
	)
	bzip2? (
		app-arch/bzip2
	)
	sys-libs/zlib"

RDEPEND="${DEPEND}"

S="${WORKDIR}/${PN}-2.0.0"

src_prepare() {
	default
	eautoconf
}

src_configure() {
	econf \
		$(use_with bzip2)
}
