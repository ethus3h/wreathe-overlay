# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

addonName="${PN/moz-ext-/}"
addonName="${addonName//-/_}"

DESCRIPTION="Mozilla extension: Fix that clicking a tab once and then moving mouse opens window."
HOMEPAGE="http://space.geocities.yahoo.co.jp/gl/alice0775"

KEYWORDS="~amd64 ~x86"
SLOT="0"
LICENSE="MPL-1.1"
# Missing original file: https://addons.mozilla.org/firefox/downloads/file/180716/bug489729_disable_detach_and_tear_off_tab-2.1-fx.xpi?src=dp-btn-version
SRC_URI="https://github.com/ethus3h/personal/raw/9b66cccc4f148ea0db640ab15417cf0ea6d43065/${addonName}-${PV}-fake-reconstructed-2017jul01a02-fx.xpi -> ${P}.zip"

S="${WORKDIR}"

src_install() {
\tif \[\[ -e "install\.rdf" \]\]; then\n\tdestDirName="$(cat install\.rdf | grep "em:id=\"" | head -n 1)"\n\tdestDirName="${destDirName#*\"}"\n\tdestDirName="${destDirName%%\"*}"\n\tif \[\[ -z "$destDirName" \]\]; then\n\t\tdestDirName="$(cat install\.rdf | grep "<em:id>" | head -n 1)"\n\t\tdestDirName="${destDirName#*>}"\n\t\tdestDirName="${destDirName%%<*}"\n\tfi\n\tif \[\[ -z "$destDirName" \]\]; then\n\t\tdestDirName="$(cat install\.rdf | grep "<id>" | head -n 1)"\n\t\tdestDirName="${destDirName#*>}"\n\t\tdestDirName="${destDirName%%<*}"\n\tfi\nelse\n\tdestDirName="$(cat install\.rdf | grep "\"id:\"" | head -n 1)"\n\tdestDirName="${destDirName#* \"}"\n\tdestDirName="${destDirName%%\",*}"\n\tfi\n	insinto "/usr/$(get_libdir)/firefox/browser/extensions/$destDirName"
	doins -r ./
}
