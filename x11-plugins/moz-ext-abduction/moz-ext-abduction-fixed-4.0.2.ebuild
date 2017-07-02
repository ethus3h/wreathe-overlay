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
IUSE=""
SRC_URI="https://addons.mozilla.org/firefox/downloads/file/340322/${addonName}-${PN}-fx.xpi -> ${P}.zip"

S="${WORKDIR}"

src_install() {
	insinto "/usr/$(get_libdir)/firefox/browser/extensions/${PN}"
	doins -r ./
}
