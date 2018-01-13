# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

inherit eutils systemd user

myCommit="ea099613e81b08a693b1f601eb5b38b753bd575e"

DESCRIPTION="Download manager for OCH, containers, video sites, http/ftp"
HOMEPAGE="http://www.pyload.org/"
SRC_URI="https://github.com/${PN}/${PN}/archive/${myCommit}.zip -> ${P}-${myCommit}.zip"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"

IUSE="crypt +curl +captcha extra javascript qt4 ssl webinterface"
RDEPEND=">=dev-lang/python-2.5[sqlite]
	crypt? ( dev-python/pycrypto )
	>=dev-python/jinja-2
	<dev-python/jinja-3
	dev-python/beaker
	dev-python/colorama
	dev-python/feedparser
	dev-python/getch
	dev-python/markupsafe
	dev-python/MultipartPostHandler
	dev-python/setuptools
	dev-python/thrift
	dev-python/WSGIserver
	extra? (
		dev-python/beautifulsoup
		dev-python/bjoern
		dev-python/colorlog
		dev-python/flup
		dev-python/notify-python
		dev-python/simplejson
	)
	curl? ( dev-python/pycurl )
	captcha? ( app-text/tesseract
		dev-python/pillow
		javascript? ( dev-lang/spidermonkey ) )
	javascript? ( net-libs/nodejs
		net-misc/pyload[captcha] )
	qt4? ( dev-python/PyQt4[webkit] )
	ssl? ( dev-python/pyopenssl )
	webinterface? ( dev-python/bottle )"

S="${WORKDIR}/${PN}-${myCommit}"

PYLOAD_DIR="/var/lib/${PN}"

pkg_setup() {
	enewgroup pyload
	# home directory is required
	enewuser pyload -1 -1 "${PYLOAD_DIR}" pyload
}

src_install() {
	dodir "/usr/share/${PN}"
	insinto "/usr/share/${PN}"
	doins -r ./*
	fowners -R pyload:pyload "/usr/share/${PN}"
	fperms -R +rx "/usr/share/${PN}"
	make_wrapper pyload "/usr/share/${PN}/pyLoadCore.py"
	make_wrapper pyloadCli "/usr/share/${PN}/pyLoadCli.py"
	if use qt4; then
		make_wrapper pyloadGui "/usr/share/${PN}/pyLoadGui.py"
		doicon icons/logo.png || die "doicon failed"
		make_desktop_entry pyLoadGui PyLoad
	fi
	UNIT_DIR="$(systemd_get_systemunitdir)"
	systemd_newunit "${FILESDIR}/pyload.service" 'pyload.service'
}
