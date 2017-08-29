# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

case "${PV}" in
	(9999*)
		KEYWORDS=""
		VCS_ECLASS=git-2
		EGIT_REPO_URI="https://github.com/kmatheussen/${PN}.git"
		EGIT_PROJECT="${PN}.git"
		;;
	(*)
		KEYWORDS="~amd64 ~x86"
		SRC_URI="http://www.notam02.no/arkiv/src/${P}.tar.gz"
		;;
esac
inherit eutils toolchain-funcs ${VCS_ECLASS}

DESCRIPTION="JACK Recording utility"
HOMEPAGE="https://github.com/kmatheussen/jack_capture http://www.notam02.no/arkiv/src"

LICENSE="GPL-2"
SLOT="0"
IUSE="gtk"

RDEPEND=">=media-libs/libsndfile-1.0.17
	>=media-sound/jack-audio-connection-kit-0.100:=
	gtk? ( x11-libs/gtk+:2 )"
DEPEND="${RDEPEND}
	gtk? ( virtual/pkgconfig )"

PATCHES=(
	"${FILESDIR}/${PN}-0.9.70-Makefile.patch"
)
DOCS=( README config )

src_compile()
{
	tc-export CC CXX
	emake PREFIX="${EPREFIX}/usr" jack_capture
	use gtk && emake PREFIX="${EPREFIX}/usr" jack_capture_gui2
}

src_install()
{
	dobin jack_capture
	use gtk && dobin jack_capture_gui2
	einstalldocs
}
