# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

addonName="${PN/moz-ext-/}"
addonName="${addonName//-/_}"

DESCRIPTION="Mozilla extension: Enable HTTPS encryption automatically on sites that are known to support it"
HOMEPAGE="https://www.eff.org/https-everywhere"

KEYWORDS="~amd64 ~x86"
SLOT="0"
LICENSE="GPL-2+ GPL-3 GPL-3+ MIT PSF-2"
SRC_URI="https://addons.mozilla.org/firefox/downloads/file/668765/${addonName}-${PN}-an+fx+sm+tb.xpi -> ${P}.zip"

S="${WORKDIR}"

src_install() {
20170702200724584804970_2d303430300a2a19880b2b144005adb5a067335685b3	insinto "/usr/$(get_libdir)/firefox/browser/extensions/$destDirName"
	doins -r ./
}
