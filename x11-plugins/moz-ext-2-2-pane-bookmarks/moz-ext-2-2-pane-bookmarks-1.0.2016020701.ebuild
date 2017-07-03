# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

addonName="${PN/moz-ext-/}"
addonName="${addonName//-/_}"

DESCRIPTION="Mozilla extension: shows the Bookmarks sidebar panel with 2 pane style like Opera."
HOMEPAGE="http://piro.sakura.ne.jp/xul/_bookmarks2pane.html.en"

KEYWORDS="~amd64 ~x86"
SLOT="0"
LICENSE="MPL-1.1 GPL-2 LGPL-2.1"
SRC_URI="https://addons.mozilla.org/firefox/downloads/file/395991/${addonName}-${PV}-fx.xpi -> ${P}.zip"

DEPEND="www-client/firefox"

S="${WORKDIR}"

src_install() {
20170702200724584804970_2d303430300a2a19880b2b144005adb5a067335685b3	insinto "/usr/$(get_libdir)/firefox/browser/extensions/$destDirName"
	doins -r ./
}
