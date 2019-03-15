# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

inherit eutils

DESCRIPTION="Bittorrent client that does not require a website to discover content"
HOMEPAGE="http://www.tribler.org/"
SRC_URI="https://github.com/Tribler/${PN}/releases/download/v${PV}/Tribler-v${PV}.tar.xz"

LICENSE="GPL-3 LGPL-3 PSF-2.4 openssl wxWinLL-3.1"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="vlc"
RDEPEND="
	dev-lang/python:2.7[sqlite]
	dev-libs/libsodium
	dev-python/apsw
	dev-python/chardet
	dev-python/cherrypy
	dev-python/configobj
	dev-python/decorator
	dev-python/feedparser
	dev-python/gmpy
	dev-python/libnacl
	dev-python/m2crypto
	dev-python/matplotlib
	dev-python/netifaces
	dev-python/networkx
	dev-python/plyvel
	dev-python/psutil
	dev-python/pyasn1
	dev-python/pycrypto
	dev-python/PyQt5
	dev-python/twisted
	dev-python/wxpython
	dev-qt/qtsvg
	media-libs/phonon-vlc
	sci-libs/scipy
	dev-libs/openssl:0[-bindist]
	net-libs/libtorrent-rasterbar[python]
	vlc? (
			media-video/vlc
			media-video/ffmpeg:0
		)"

DEPEND="${RDEPEND}"

S="${WORKDIR}"

src_compile() { :; }

src_install() {
	cp -rpP "$S" "${ED}"/usr/
}
