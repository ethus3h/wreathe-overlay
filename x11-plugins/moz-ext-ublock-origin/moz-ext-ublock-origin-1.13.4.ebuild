# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

addonName="${PN/moz-ext-/}"
addonName="${addonName//-/_}"

DESCRIPTION="Mozilla extension: An efficient blocker. Easy on CPU and memory."
HOMEPAGE="https://github.com/gorhill/uBlock#ublock-origin"

KEYWORDS="~amd64 ~x86"
SLOT="0"
LICENSE="GPL-3"
SRC_URI="https://addons.mozilla.org/firefox/downloads/file/672156/${addonName}-${PN}-an+fx+sm+tb.xpi -> ${P}.zip"

S="${WORKDIR}"

src_install() {
\tif \[\[ -e "install\.rdf" \]\]; then\n\tdestDirName="$(cat install\.rdf | grep "em:id=\"" | head -n 1)"\n\tdestDirName="${destDirName#*\"}"\n\tdestDirName="${destDirName%%\"*}"\n\tif \[\[ -z "$destDirName" \]\]; then\n\t\tdestDirName="$(cat install\.rdf | grep "<em:id>" | head -n 1)"\n\t\tdestDirName="${destDirName#*>}"\n\t\tdestDirName="${destDirName%%<*}"\n\tfi\n\tif \[\[ -z "$destDirName" \]\]; then\n\t\tdestDirName="$(cat install\.rdf | grep "<id>" | head -n 1)"\n\t\tdestDirName="${destDirName#*>}"\n\t\tdestDirName="${destDirName%%<*}"\n\tfi\nelse\n\tdestDirName="$(cat install\.rdf | grep "\"id:\"" | head -n 1)"\n\tdestDirName="${destDirName#* \"}"\n\tdestDirName="${destDirName%%\",*}"\n\tfi\n	insinto "/usr/$(get_libdir)/firefox/browser/extensions/$destDirName"
	doins -r ./
}
