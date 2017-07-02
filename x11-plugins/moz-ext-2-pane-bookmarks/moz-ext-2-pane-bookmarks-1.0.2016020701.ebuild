# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Mozilla extension: shows the Bookmarks sidebar panel with 2 pane style like Opera."
HOMEPAGE="http://www.enigmail.net/"

KEYWORDS="~amd64 ~x86"
SLOT="0"
LICENSE="MPL-1.1 GPL-2 LGPL-2.1"
IUSE=""
SRC_URI="https://addons.mozilla.org/firefox/downloads/file/395991/2_2_pane_bookmarks-${PV}-fx.xpi"

src_install() {
	insinto "/usr/$(get_libdir)/firefox/browser/extensions/${PN}"
	doins -r ./
}
