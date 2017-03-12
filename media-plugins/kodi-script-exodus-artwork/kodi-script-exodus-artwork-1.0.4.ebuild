# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

DESCRIPTION="Zero-cost video source search tool: artwork"
HOMEPAGE="https://offshoregit.com/exodus/script.exodus.artwork/"
SRC_URI="https://offshoregit.com/exodus/script.exodus.artwork/script.exodus.artwork-1.0.4.zip"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	media-tv/kodi
	"

RDEPEND="${DEPEND}"

addonName="${PN/kodi-/}"
S="${WORKDIR}/${addonName//-/.}"
