# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# @ECLASS: moz-ext.eclass
# @MAINTAINER: kolubat@gmail.com
# @BLURB: generic ebuild for Mozilla plugins

addonName="${PN/moz-ext-/}"
addonName="${addonName//-/_}"

if [[ -z "$addonPv" ]]; then
	addonPv="${PV}"
fi

DESCRIPTION="Mozilla extension: ${addonName}"
SLOT="0"

for app in "${mozApps[@]}"; do
	case $app in
	fx)
		IUSE+=" firefox"
		use firefox && DEPEND+=" www-client/firefox"
		;;
	*)
		echo "(Not installing for unknown Mozilla app $app)"
		;;
	esac
done

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
