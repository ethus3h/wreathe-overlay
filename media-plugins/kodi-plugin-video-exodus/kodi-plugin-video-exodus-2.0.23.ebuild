# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

DESCRIPTION="Video search tool"
HOMEPAGE="https://offshoregit.com/exodus/plugin.video.exodus/"
SRC_URI="https://offshoregit.com/exodus/plugin.video.exodus/plugin.video.exodus-2.0.24.zip"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	media-tv/kodi
	=media-plugins/kodi-script-exodus-artwork-1.0.4
	=media-plugins/kodi-script-exodus-metadata-1.0.0
	"
#	=media-plugins/kodi-script-module-urlresolver-3.0.0
#	=media-plugins/kodi-script-module-metahandler-1.0.0

RDEPEND="${DEPEND}"

addonName="${PN/kodi-/}"
S="${WORKDIR}/${addonName//-/.}"

src_prepare() {
	#disable automatic updates
	perl -p -i -e 's/\t\t<import addon="repository\.exodus" version="[\d\.]+" \/>//g' "${S}"/addon.xml
}
