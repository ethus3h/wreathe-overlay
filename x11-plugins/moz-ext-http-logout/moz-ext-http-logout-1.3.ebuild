# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

addonName="${PN/moz-ext-/}"
addonName="${addonName//-/_}"

DESCRIPTION="Mozilla extension: log out all HTTP authenticated sessions"
HOMEPAGE="http://www.cs.toronto.edu/~jdd/httplogout"

KEYWORDS="~amd64 ~x86"
SLOT="0"
LICENSE="freedist" # FIXME
SRC_URI="https://addons.mozilla.org/firefox/downloads/file/186112/${addonName}-${PN}-fx.xpi -> ${P}.zip"

S="${WORKDIR}"

src_install() {
\tif \[\[ -e "install\.rdf" \]\]; then\n\tdestDirName="$(cat install\.rdf | grep "em:id=\"" | head -n 1)"\n\tdestDirName="${destDirName#*\"}"\n\tdestDirName="${destDirName%%\"*}"\n\tif \[\[ -z "$destDirName" \]\]; then\n\t\tdestDirName="$(cat install\.rdf | grep "<em:id>" | head -n 1)"\n\t\tdestDirName="${destDirName#*>}"\n\t\tdestDirName="${destDirName%%<*}"\n\tfi\n\tif \[\[ -z "$destDirName" \]\]; then\n\t\tdestDirName="$(cat install\.rdf | grep "<id>" | head -n 1)"\n\t\tdestDirName="${destDirName#*>}"\n\t\tdestDirName="${destDirName%%<*}"\n\tfi\nelse\n\tdestDirName="$(cat install\.rdf | grep "\"id:\"" | head -n 1)"\n\tdestDirName="${destDirName#* \"}"\n\tdestDirName="${destDirName%%\",*}"\n\tfi\n	insinto "/usr/$(get_libdir)/firefox/browser/extensions/$destDirName"
	doins -r ./
}
