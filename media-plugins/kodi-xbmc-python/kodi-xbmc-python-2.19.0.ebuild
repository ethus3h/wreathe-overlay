# Copyright 2015 Daniel 'herrnst' Scheller, Team Kodi
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit kodi-addon

DESCRIPTION="Zero-cost video source search tool"
HOMEPAGE="https://offshoregit.com/exodus/plugin.video.exodus/"
SRC_URI="https://offshoregit.com/exodus/plugin.video.exodus/plugin.video.exodus-2.0.24.zip"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	media-tv/kodi
	media-libs/kodiplatform
	media-libs/kodi-xbmc-python
	media-libs/kodi-script-exodus-artwork
	media-libs/kodi-script-exodus-metadata
	media-libs/kodi-script-module-urlresolver
	media-libs/kodi-script-module-metahandler
	"

RDEPEND="${DEPEND}"

src_prepare() {
	#disable automatic updates
	perl -p -i -e 's/\t\t<import addon="repository\.exodus" version="[\d\.]+" \/>//g' ${S}/addon.xml
}
