# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

addonName="${PN/moz-ext-/}"
addonName="${addonName//-/_}"

myCommit="f29a9ab87b8c75324b8955727152833f9c28f99c"
DESCRIPTION="Mozilla extension: a Flash VM and runtime written in JavaScript"
HOMEPAGE="https://github.com/mozilla/shumway"

KEYWORDS="~amd64 ~x86"
SLOT="0"
LICENSE="Apache-2.0"
SRC_URI="https://github.com/mozilla/${addonName}/raw/${myCommit}/extension/firefox/${addonName}.xpi -> ${P}.zip"

S="${WORKDIR}"

src_install() {
20170702200724584804970_2d303430300a2a19880b2b144005adb5a067335685b3	insinto "/usr/$(get_libdir)/firefox/browser/extensions/$destDirName"
	doins -r ./
}
