# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

addonName="${PN/moz-ext-/}"
addonName="${addonName//-/_}"

DESCRIPTION="Mozilla extension: Gives performance & network tweaks for Firefox"
HOMEPAGE="https://addons.mozilla.org/en-GB/firefox/addon/rsccmanfasterfox/"

KEYWORDS="~amd64 ~x86"
SLOT="0"
LICENSE="MPL-1.1 GPL-2 LGPL-2.1 GPL-3"
IUSE=""
# There are newer versions, but the licensing is screwed up on them, and they don't appear to be critical updates anyway.
SRC_URI="https://addons.mozilla.org/firefox/downloads/file/157259/${addonName}-${PN}-fx.xpi -> ${P}.zip"

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
