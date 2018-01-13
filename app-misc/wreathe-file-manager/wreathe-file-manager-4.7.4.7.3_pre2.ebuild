# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Metapackage to pull in Wreathe file manager (Dolphin 1)"
HOMEPAGE="https://futuramerlin.com/"

LICENSE="AGPL-3 BSD-2"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="kde-apps/dolphin:4
	<kde-apps/dolphin-4.8
	=kde-apps/dolphin-9999"
DEPEND="${RDEPEND}"
