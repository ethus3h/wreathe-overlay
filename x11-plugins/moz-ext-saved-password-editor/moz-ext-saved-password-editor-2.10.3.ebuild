# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

addonName="${PN/moz-ext-/}"
addonName="${addonName//-/_}"

DESCRIPTION="Mozilla extension: This enables quick check/uncheck of checkboxes..."
HOMEPAGE="https://groups.google.com/forum/#!forum/ddawson-addonssupport"

KEYWORDS="~amd64 ~x86"
SLOT="0"
LICENSE="GPL-3"
IUSE=""
SRC_URI="https://addons.mozilla.org/firefox/downloads/file/544451/${addonName}-${PN}-fx+sm+tb.xpi -> ${P}.zip"

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
	if [[ -z "$destDirName" ]]; then
		destDirName="$(cat install.rdf | grep "<id>" | head -n 1)"
		destDirName="${destDirName#*>}"
		destDirName="${destDirName%%<*}"
	fi
	insinto "/usr/$(get_libdir)/firefox/browser/extensions/$destDirName"
	doins -r ./
}
