# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit autotools

DESCRIPTION="Helps you sort file trees and pack them into bags"
HOMEPAGE="https://sourceforge.net/projects/fpart/"
SRC_URI="mirror://sourceforge/fpart/${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64"

src_prepare() {
	default
	eautoreconf
}

src_install() {
	emake DESTDIR="${D}" install

	dodoc Changelog TODO README docs/*
}
