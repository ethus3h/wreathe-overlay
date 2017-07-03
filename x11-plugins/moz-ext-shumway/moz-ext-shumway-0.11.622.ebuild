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
	if [[ -e "install.rdf" ]]; then
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
	else
		destDirName="$(cat manifest.json | grep "\"id:\"" | head -n 1)"
		destDirName="${destDirName#* \"}"
		destDirName="${destDirName%%\",*}"
	fi
	insinto "/usr/$(get_libdir)/firefox/browser/extensions/$destDirName"
	doins -r ./
}
