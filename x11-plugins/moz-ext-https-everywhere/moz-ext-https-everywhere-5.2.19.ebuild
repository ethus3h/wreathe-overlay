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
	if [[ -e "install.rdf" ]]; then
		destDirName="$(cat install.rdf | sed 's/\r/\n/g' | grep "em:id=\"" | grep -v "ec8030f7-c20a-464f-9b0e-13a3a9e97384" | head -n 1)"
		destDirName="${destDirName#*\"}"
		destDirName="${destDirName%%\"*}"
		if [[ -z "$destDirName" ]]; then
			destDirName="$(cat install.rdf | sed 's/\r/\n/g' | grep "<em:id>" | grep -v "ec8030f7-c20a-464f-9b0e-13a3a9e97384" | head -n 1)"
			destDirName="${destDirName#*>}"
			destDirName="${destDirName%%<*}"
		fi
		if [[ -z "$destDirName" ]]; then
			destDirName="$(cat install.rdf | sed 's/\r/\n/g' | grep "<id>" | grep -v "ec8030f7-c20a-464f-9b0e-13a3a9e97384" | head -n 1)"
			destDirName="${destDirName#*>}"
			destDirName="${destDirName%%<*}"
		fi
	else
		destDirName="$(cat manifest.json | grep "\"id\":" | grep -v "ec8030f7-c20a-464f-9b0e-13a3a9e97384" | head -n 1)"
		destDirName="${destDirName#*: \"}"
		destDirName="${destDirName%%\",*}"
	fi
	insinto "/usr/$(get_libdir)/firefox/browser/extensions/$destDirName"
	doins -r ./
}
