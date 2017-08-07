# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit kodi-plugin

LICENSE="GPL-2"
KEYWORDS="~amd64 ~x86"

DEPEND="
	>=media-plugins/kodi-script-common-plugin-cache-2.5.5
	>=media-plugins/kodi-script-module-requests-2.4.3
	"
