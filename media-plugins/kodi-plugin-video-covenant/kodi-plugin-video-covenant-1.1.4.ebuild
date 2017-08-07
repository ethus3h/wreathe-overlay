# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit kodi-repository-colossus

DESCRIPTION="Kodi add-on: plugin.video.covenant"
HOMEPAGE="https://github.com/Colossal1/repository.colossus"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	media-tv/kodi
	>=media-plugins/kodi-script-covenant-artwork-1.0.0
	>=media-plugins/kodi-script-covenant-metadata-1.0.0
	>=media-plugins/kodi-script-module-urlresolver-3.0.0
	>=media-plugins/kodi-script-module-metahandler-1.0.0
	"

RDEPEND="${DEPEND}"
