# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

addonName="${PN/moz-ext-/}"
addonName="${addonName//-/_}"

DESCRIPTION="Mozilla extension: Squared tabs, appmenu, add-on bar, small button view and many more 'old' features"
HOMEPAGE="https://github.com/Aris-t2/ClassicThemeRestorer"

KEYWORDS="~amd64 ~x86"
SLOT="0"
LICENSE="MIT"
IUSE=""
SRC_URI="https://addons.mozilla.org/firefox/downloads/file/666292/${addonName}-${PN}-fx.xpi -> ${P}.zip"

S="${WORKDIR}"

src_install() {
	destDirName="$(cat install.rdf | grep "em:id=\"" | head -n 1)"
	destDirName="${destDirName#*\"}"
	destDirName="${destDirName%%\"*}"
	insinto "/usr/$(get_libdir)/firefox/browser/extensions/$destDirName"
	doins -r ./
}
