# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

addonName="${PN/kodi-/}"
addonName="${addonName//-/.}"

DESCRIPTION="Kodi add-on: script.module.beautifulsoup"
HOMEPAGE="https://kodi.tv/"
SRC_URI="http://mirrors.kodi.tv/addons/krypton/${addonName}/${addonName}-${PV}.zip"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	media-tv/kodi
	"

RDEPEND="${DEPEND}"

S="${WORKDIR}/${addonName}"

src_install() {
	insinto "/usr/share/kodi/addons/${addonName}"
	doins -r *
}
