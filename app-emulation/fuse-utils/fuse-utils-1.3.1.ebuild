# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils

DESCRIPTION="Utils for the Free Unix Spectrum Emulator by Philip Kendall"
HOMEPAGE="http://fuse-emulator.sourceforge.net"
SRC_URI="mirror://sourceforge/fuse-emulator/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="audiofile gcrypt"

RDEPEND="~app-emulation/libspectrum-1.3.2[gcrypt?]
	audiofile? ( >=media-libs/audiofile-0.2.3 )"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

src_configure() {
	econf \
	$(use_with audiofile ) \
	$(use_with gcrypt libgcrypt) \
	|| die "Configure failed!"
}

src_install() {
	emake install DESTDIR="${D}" || die "install failed"
	dodoc AUTHORS ChangeLog README
	doman man/*.1
}
