# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="6"

inherit exteutils git-r3

RESTRICT="mirror"
IUSE=""

DESCRIPTION="A mixer app for jack"
HOMEPAGE="http://www.arnoldarts.de/JackMix%3Aintro"
EGIT_REPO_URI="https://github.com/kampfschlaefer/jackmix.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="media-sound/jack-audio-connection-kit
	dev-qt/qtcore
	dev-qt/qtgui
	dev-qt/qtxmlpatterns
	>=media-libs/liblo-0.23
	virtual/liblash"
DEPEND="${RDEPEND}
	dev-util/scons
	virtual/pkgconfig"

src_compile() {
	tc-export CC CXX
	QTDIR=/usr \
	scons CXXFLAGS="${CXXFLAGS}" qtlibs=/usr/lib/qt5 prefix="${D}"/usr || die "make failed"
}

src_install() {
#	scons install || die
	dobin "${PN}/${PN}"
	dodoc AUTHORS ChangeLog
	make_desktop_entry "${PN}" "JackMix" Audio "AudioVideo;Audio;Mixer"
}
