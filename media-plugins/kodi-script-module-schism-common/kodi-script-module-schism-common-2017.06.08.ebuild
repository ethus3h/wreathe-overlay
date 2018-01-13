# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

kodi_repo="elysium"
inherit kodi-plugin

LICENSE="GPL-2"
KEYWORDS="~amd64 ~x86"

DEPEND="
	media-tv/kodi
	media-plugins/kodi-script-module-six
	media-plugins/kodi-script-module-metahandler
	media-plugins/kodi-script-module-beautifulsoup
	"

RDEPEND="${DEPEND}"
