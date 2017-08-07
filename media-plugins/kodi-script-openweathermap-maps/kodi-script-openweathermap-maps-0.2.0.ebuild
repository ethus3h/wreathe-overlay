# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit kodi-plugin

DESCRIPTION="Kodi add-on: script.openweathermap.maps"
SRC_URI="http://mirrors.kodi.tv/addons/krypton/${addonName}/${addonName}-${PV}.zip"

LICENSE="GPL-2"
KEYWORDS="~amd64 ~x86"

RDEPEND="${DEPEND}"

S="${WORKDIR}/${addonName}"
