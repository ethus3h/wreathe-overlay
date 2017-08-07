# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Original Author: ethus3h

addonName="${PN/kodi-/}"
addonName="${addonName//-/.}"

HOMEPAGE="https://kodi.tv/"
SLOT="0"

DEPEND+=" media-tv/kodi"

S="${WORKDIR}/${addonName}"

kodi-plugin_src_install() {
	insinto "/usr/share/kodi/addons/${addonName}"
	doins -r *
}

EXPORT_FUNCTIONS src_install
