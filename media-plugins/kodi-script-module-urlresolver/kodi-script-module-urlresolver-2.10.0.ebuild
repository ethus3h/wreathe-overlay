# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit kodi-plugin

LICENSE="GPL-2"
KEYWORDS="~amd64 ~x86"

DEPEND="
	>=media-plugins/kodi-script-module-simplejson-3.3.0
	>=media-plugins/kodi-script-module-t0mm0-common-2.0.0
	"

RDEPEND="${DEPEND}"
