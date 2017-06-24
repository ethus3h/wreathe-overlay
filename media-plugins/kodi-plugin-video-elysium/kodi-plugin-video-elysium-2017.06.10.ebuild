# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

addonName="${PN/kodi-/}"
addonName="${addonName//-/.}"

DESCRIPTION="Elysium Common Libraries"
HOMEPAGE="https://github.com/OpenELEQ/repository.elysium"
SRC_URI="https://github.com/OpenELEQ/repository.elysium/blob/master/${addonName}/${addonName}-${PV}.zip?raw=true -> ${addonName}-${PV}.zip"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	media-tv/kodi
	=media-plugins/kodi-script-elysium-artwork-2017.06.08
	=media-plugins/kodi-script-module-schism-common-2017.06.08
	"

RDEPEND="${DEPEND}"

S="${WORKDIR}/${addonName}"

src_prepare() {
	default
	#disable automatic updates
	#perl -p -i -e 's/\t\t<import addon="repository\.exodus" version="[\d\.]+" \/>//g' "${S}"/addon.xml
	true
}

src_install() {
	insinto "/usr/share/kodi/addons/${addonName}"
	doins -r *
}
