# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="Zero-cost video source search tool: metadata"
HOMEPAGE="https://offshoregit.com/exodus/script.exodus.metadata/"
SRC_URI="https://offshoregit.com/exodus/script.exodus.metadata/script.exodus.metadata-1.0.0.zip"

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
