# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# @ECLASS: kodi-plugin.eclass
# @MAINTAINER: kolubat@gmail.com
# @BLURB: generic ebuild for Kodi plugins

kodi_version_codename="krypton"
colossus_commit="c46e6ad5769bd55fd594909cc7af1962245f7c21"
colossuscommon_commit="c9116626cc842d5d1f6494f29cf4c8677c24cce1"
elysium_commit="715b5b3266b91f626b535b6673023d74ce2cb6e2"
kodinerds_commit="c2ac5727dca70638f6271c0b4930e1ab106b8d03"

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
