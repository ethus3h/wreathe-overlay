# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit kodi-plugin

LICENSE="GPL-2"
KEYWORDS="~amd64 ~x86"

DEPEND="
	>=media-plugins/kodi-script-openweathermap-maps-0.02.0
	"

RDEPEND="${DEPEND}"
