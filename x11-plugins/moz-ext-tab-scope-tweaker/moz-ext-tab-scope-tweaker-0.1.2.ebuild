# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

addonName="${PN/moz-ext-/}"
addonName="${addonName//-/_}"

DESCRIPTION="Mozilla extension: Some tweaks for Tab Scope extension"
HOMEPAGE="https://github.com/Infocatcher/Tab_Scope_Tweaker/issues"

KEYWORDS="~amd64 ~x86"
SLOT="0"
LICENSE="MPL-1.1"
SRC_URI="https://addons.mozilla.org/firefox/downloads/file/651531/${addonName}-${PN}-fx.xpi -> ${P}.zip"

DEPEND="x11-plugins/moz-ext-tab-scope"
RDEPEND="${DEPEND}"

S="${WORKDIR}"

src_install() {
20170702200724584804970_2d303430300a2a19880b2b144005adb5a067335685b3	insinto "/usr/$(get_libdir)/firefox/browser/extensions/$destDirName"
	doins -r ./
}
