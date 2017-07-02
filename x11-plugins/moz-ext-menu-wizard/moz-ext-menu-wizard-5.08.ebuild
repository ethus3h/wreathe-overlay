# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

addonName="${PN/moz-ext-/}"
addonName="${addonName//-/_}"

DESCRIPTION="Mozilla extension: Remove, move, rename, and restyle menus and menu items; edit shortcuts"
HOMEPAGE="http://www.s3blog.org/s3menu-wizard.html"

KEYWORDS="~amd64 ~x86"
SLOT="0"
LICENSE="MPL-2.0"
IUSE=""
SRC_URI="https://addons.mozilla.org/firefox/downloads/file/621144/${addonName}-${PN}-fx+sm+tb.xpi -> ${P}.zip"

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
