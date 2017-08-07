# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit colossus

DESCRIPTION="Kodi add-on: plugin.video.covenant"
HOMEPAGE="https://github.com/Colossal1/repository.colossus"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	media-tv/kodi
	media-plugins/kodi-script-elysium-artwork
	media-plugins/kodi-script-module-urlresolver
	media-plugins/kodi-script-module-metahandler
	media-plugins/kodi-script-module-requests
	media-plugins/kodi-script-module-beautifulsoup
	media-plugins/kodi-script-module-schism-common
	media-plugins/kodi-script-module-futures
	"

RDEPEND="${DEPEND}"

S="${WORKDIR}/${addonName}"
