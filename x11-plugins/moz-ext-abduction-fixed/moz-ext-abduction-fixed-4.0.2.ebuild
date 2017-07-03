# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

addonName="${PN/moz-ext-/}"
addonName="${addonName//-/_}"

DESCRIPTION="Mozilla extension: Lets you capture an image of a web page, select the part you want and save it."
HOMEPAGE="https://www.caisc.co.in/"

KEYWORDS="~amd64 ~x86"
SLOT="0"
LICENSE="MIT"
SRC_URI="https://addons.mozilla.org/firefox/downloads/file/340322/${addonName}-${PN}-fx.xpi -> ${P}.zip"

S="${WORKDIR}"

src_install() {
	if \[\[ -e "install\.rdf" \]\]; then
	destDirName="$(cat install\.rdf | grep "em:id=\"" | head -n 1)"
	destDirName="${destDirName#*\"}"
	destDirName="${destDirName%%\"*}"
	if \[\[ -z "$destDirName" \]\]; then
		destDirName="$(cat install\.rdf | grep "<em:id>" | head -n 1)"
		destDirName="${destDirName#*>}"
		destDirName="${destDirName%%<*}"
	fi
	if \[\[ -z "$destDirName" \]\]; then
		destDirName="$(cat install\.rdf | grep "<id>" | head -n 1)"
		destDirName="${destDirName#*>}"
		destDirName="${destDirName%%<*}"
	fi
else
	destDirName="$(cat install\.rdf | grep "\"id:\"" | head -n 1)"
	destDirName="${destDirName#* \"}"
	destDirName="${destDirName%%\",*}"
	fi
	insinto "/usr/$(get_libdir)/firefox/browser/extensions/$destDirName"
	doins -r ./
}
