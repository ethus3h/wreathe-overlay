# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

kodi_repo="colossuscommon"
inherit kodi-plugin

LICENSE="GPL-2"
KEYWORDS="~amd64 ~x86"

DEPEND="
	media-plugins/kodi-plugin-video-youtube
	media-plugins/kodi-script-module-python-twitch
	>=media-plugins/kodi-script-module-cryptopy-1.2.6
	"

RDEPEND="${DEPEND}"
