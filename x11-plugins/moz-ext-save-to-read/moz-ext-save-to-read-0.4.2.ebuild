# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

addonName="${PN/moz-ext-/}"
addonName="${addonName//-/_}"

DESCRIPTION="Mozilla extension: Allows to add or remove links in one click to read it later."
HOMEPAGE="https://addons.mozilla.org/en-GB/firefox/addon/save-to-read/"

KEYWORDS="~amd64 ~x86"
SLOT="0"
LICENSE="GPL-3"
IUSE=""
SRC_URI="https://addons.mozilla.org/firefox/downloads/file/207410/${addonName}-${PN}-fx.xpi -> ${P}.zip"

S="${WORKDIR}"

src_install() {
	destDirName="$(cat install.rdf | grep "em:id=\"" | head -n 1)"
	destDirName="${destDirName#*\"}"
	destDirName="${destDirName%%\"*}"
	if [[ -z "$destDirName" ]]; then
		destDirName="$(cat install.rdf | grep "<em:id>" | head -n 1)"
		destDirName="${destDirName#*>}"
		destDirName="${destDirName%%<*}"
	fi
	insinto "/usr/$(get_libdir)/firefox/browser/extensions/$destDirName"
	doins -r ./
}
