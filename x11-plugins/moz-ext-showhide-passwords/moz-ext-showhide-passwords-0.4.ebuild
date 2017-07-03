# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

addonName="${PN/moz-ext-/}"
addonName="${addonName//-/_}"

DESCRIPTION="Mozilla extension: Add a link near password fields to hide or show passwords."
HOMEPAGE="https://addons.mozilla.org/en-GB/firefox/addon/showhide-passwords/"

KEYWORDS="~amd64 ~x86"
SLOT="0"
LICENSE="MPL-2.0"
SRC_URI="https://addons.mozilla.org/firefox/downloads/file/599873/${addonName}-${PN}-an+fx.xpi -> ${P}.zip"

S="${WORKDIR}"

src_install() {
	destDirName='shpassword@shpassword.fr'
	insinto "/usr/$(get_libdir)/firefox/browser/extensions/$destDirName"
	doins -r ./
}
