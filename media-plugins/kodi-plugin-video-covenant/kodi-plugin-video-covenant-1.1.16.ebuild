# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

kodi_repo="colossus"
inherit kodi-plugin

LICENSE="GPL-3"
KEYWORDS="~amd64 ~x86"

DEPEND="
	>=media-plugins/kodi-script-covenant-artwork-1.0.0
	>=media-plugins/kodi-script-covenant-metadata-1.0.0
	>=media-plugins/kodi-script-module-urlresolver-3.0.0
	>=media-plugins/kodi-script-module-metahandler-1.0.0
	"

RDEPEND="${DEPEND}"
