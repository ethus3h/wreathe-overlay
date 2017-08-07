# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# @ECLASS: kodi-plugin.eclass
# @MAINTAINER: kolubat@gmail.com
# @BLURB: generic ebuild for Kodi plugins

kodi_version_codename="krypton"
colossus_commit="6b49b1d0569910ba4a3fe05e03c08dc56a4ec852"
colossuscommon_commit="48b411cd97944123439e6570938ab29a70a9c065"
elysium_commit="3b672f287c71bca25a5ad98d99ac722344768bf8"
kodinerds_commit="3b672f287c71bca25a5ad98d99ac722344768bf8"

addonName="${PN/kodi-/}"
addonName="${addonName//-/.}"
if [[ -z "$addonPv" ]]; then
	addonPv="${PV}"
fi

DESCRIPTION="Kodi add-on: ${addonName}"
SLOT="0"

DEPEND+=" media-tv/kodi"

S="${WORKDIR}/${addonName}"

if [[ -n "$kodi_repo" ]]; then
	case $kodi_repo in
	colossus)
		HOMEPAGE="https://github.com/Colossal1/repository.colossus"
		SRC_URI="https://github.com/Colossal1/repository.colossus/blob/${colossus_commit}/${addonName}/${addonName}-${addonPv}.zip?raw=true -> ${addonName}-${PV}.zip"
		;;
	colossuscommon)
		HOMEPAGE="https://github.com/Colossal1/repository.colossus.common"
		SRC_URI="https://github.com/Colossal1/repository.colossus.common/blob/${colossuscommon_commit}/${addonName}/${addonName}-${addonPv}.zip?raw=true -> ${addonName}-${PV}.zip"
		;;
	elysium)
		HOMEPAGE="https://github.com/OpenELEQ/repository.elysium"
		SRC_URI="https://github.com/OpenELEQ/repository.elysium/blob/${elysium_commit}/${addonName}/${addonName}-${addonPv}.zip?raw=true -> ${addonName}-${PV}.zip"
		;;
	kodinerds)
		HOMEPAGE="https://github.com/kodinerds/repo"
		SRC_URI="https://github.com/kodinerds/repo/blob/${kodinerds_commit}/${addonName}/${addonName}-${addonPv}.zip?raw=true -> ${addonName}-${PV}.zip"
		;;
	*)
		echo "Unknown repository."
		exit 1
		;;
	esac
else
	HOMEPAGE="https://kodi.tv/"
	SRC_URI="http://mirrors.kodi.tv/addons/${kodi_version_codename}/${addonName}/${addonName}-${PV}.zip"
fi

kodi-plugin_src_install() {
	insinto "/usr/share/kodi/addons/${addonName}"
	doins -r ./*
}

EXPORT_FUNCTIONS src_install
