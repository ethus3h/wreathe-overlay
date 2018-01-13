# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

#addonPv="2017.07.20a"
kodi_repo="elysium"
inherit kodi-plugin

LICENSE="GPL-2"
KEYWORDS="~amd64 ~x86"

DEPEND="
	media-plugins/kodi-script-elysium-artwork
	media-plugins/kodi-script-module-urlresolver
	media-plugins/kodi-script-module-metahandler
	media-plugins/kodi-script-module-requests
	media-plugins/kodi-script-module-beautifulsoup
	media-plugins/kodi-script-module-schism-common
	media-plugins/kodi-script-module-futures
	"

RDEPEND="${DEPEND}"

src_prepare() {
	default
	#disable automatic updates
	#perl -p -i -e 's/\t\t<import addon="repository\.exodus" version="[\d\.]+" \/>//g' "${S}"/addon.xml
}
