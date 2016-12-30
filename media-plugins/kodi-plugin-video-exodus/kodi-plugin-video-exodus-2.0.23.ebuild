# Copyright 2015 Daniel 'herrnst' Scheller, Team Kodi
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

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
	=media-libs/kodi-script-exodus-artwork-1.0.4
	=media-libs/kodi-script-exodus-metadata-1.0.0
	=media-libs/kodi-script-module-urlresolver-3.0.0
	=media-libs/kodi-script-module-metahandler-1.0.0
	"

RDEPEND="${DEPEND}"

src_prepare() {
	#disable automatic updates
	perl -p -i -e 's/\t\t<import addon="repository\.exodus" version="[\d\.]+" \/>//g' ${S}/addon.xml
}
