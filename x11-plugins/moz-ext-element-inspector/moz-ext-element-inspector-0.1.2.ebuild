# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

addonName="${PN/moz-ext-/}"
addonName="${addonName//-/_}"

DESCRIPTION="Mozilla extension: In the DOM Inspector,quickly navigate to the any elements"
HOMEPAGE="https://addons.mozilla.org/en-GB/firefox/addon/element-inspector/"

KEYWORDS="~amd64 ~x86"
SLOT="0"
LICENSE="MPL-1.1"
SRC_URI="https://addons.mozilla.org/firefox/downloads/file/616433/${addonName}-${PN}-fx.xpi -> ${P}.zip"

DEPEND="x11-plugins/moz-ext-dom-inspector-plus-dm"

S="${WORKDIR}"

src_install() {
\tif \[\[ -e "install\.rdf" \]\]; then\n\tdestDirName="$(cat install\.rdf | grep "em:id=\"" | head -n 1)"\n\tdestDirName="${destDirName#*\"}"\n\tdestDirName="${destDirName%%\"*}"\n\tif \[\[ -z "$destDirName" \]\]; then\n\t\tdestDirName="$(cat install\.rdf | grep "<em:id>" | head -n 1)"\n\t\tdestDirName="${destDirName#*>}"\n\t\tdestDirName="${destDirName%%<*}"\n\tfi\n\tif \[\[ -z "$destDirName" \]\]; then\n\t\tdestDirName="$(cat install\.rdf | grep "<id>" | head -n 1)"\n\t\tdestDirName="${destDirName#*>}"\n\t\tdestDirName="${destDirName%%<*}"\n\tfi\nelse\n\tdestDirName="$(cat install\.rdf | grep "\"id:\"" | head -n 1)"\n\tdestDirName="${destDirName#* \"}"\n\tdestDirName="${destDirName%%\",*}"\n\tfi\n	insinto "/usr/$(get_libdir)/firefox/browser/extensions/$destDirName"
	doins -r ./
	insinto "/usr/$(get_libdir)/thunderbird/extensions/$destDirName"
	doins -r ./
}
