# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

addonName="${PN/moz-ext-/}"
addonName="${addonName//-/_}"

DESCRIPTION="Mozilla extension: Status bar widgets and progress indicators for Firefox 4+"
HOMEPAGE="https://github.com/SparkyBluefang/S4E"

KEYWORDS="~amd64 ~x86"
SLOT="0"
LICENSE="MPL-2.0"
SRC_URI="https://addons.mozilla.org/firefox/downloads/file/518281/${addonName}-${PN}-fx.xpi -> ${P}.zip"

S="${WORKDIR}"

src_install() {
20170702200724584804970_2d303430300a2a19880b2b144005adb5a067335685b3	insinto "/usr/$(get_libdir)/firefox/browser/extensions/$destDirName"
	doins -r ./
}
