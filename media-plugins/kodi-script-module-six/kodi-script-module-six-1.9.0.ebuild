# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

addonName="${PN/kodi-/}"
addonName="${addonName//-/.}"

DESCRIPTION="Kodi add-on: script.module.six"
HOMEPAGE="https://kodi.tv/"
SRC_URI="http://mirrors.kodi.tv/addons/krypton/${addonName}/${addonName}-${PV}.zip"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	media-tv/kodi
	"

RDEPEND="${DEPEND}"

S="${WORKDIR}/${addonName}"

src_install() {
	insinto "/usr/share/kodi/addons/${addonName}"
	doins -r *
	(
		# Install a patch for Kodi that enables this add-on by default
		patchFile="default-enable-addon-${addonName}.patch"
		echo "diff -uraN a/xbmc/system/addon-manifest.xml b/xbmc/system/addon-manifest.xml" > "$patchFile"
		echo "--- a/xbmc/system/addon-manifest.xml    2017-06-24 18:56:32.000000000 -0400" >> "$patchFile"
		echo "+++ b/xbmc/system/addon-manifest.xml    2017-06-24 19:00:04.000000000 -0400" >> "$patchFile"
		echo "@@ -1,1 +1,2 @@" >> "$patchFile"
		echo " <addons>" >> "$patchFile"
		echo "+  <addon>${addonName}</addon>" >> "$patchFile"
		insinto "/etc/portage/patches/media-tv/kodi/"
		doins "$patchFile"
	)
}
