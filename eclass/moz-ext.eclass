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
	appString="$appString+$app"
	case $app in
	fx)
		IUSE+=" firefox"
		use firefox && DEPEND+=" www-client/firefox"
		;;
	sm)
		IUSE+=" seamonkey"
		use seamonkey && DEPEND+=" www-client/seamonkey"
		;;
	tb)
		IUSE+=" thunderbird"
		use thunderbird && DEPEND+=" www-client/thunderbird"
		;;
	*)
		echo "(Not installing for unknown Mozilla app $app)"
		;;
	esac
done

if [[ -n "$mozId" ]]; then
	SRC_URI="https://addons.mozilla.org/firefox/downloads/file/$mozId/${addonName}-${addonPv}-$appString.xpi -> ${P}.zip"
fi

S="${WORKDIR}"

moz-ext_src_install() {
	if [[ -e "install.rdf" ]]; then
		destDirName="$(cat install.rdf | sed 's/\r/\n/g' | grep "em:id=\"" | grep -v "ec8030f7-c20a-464f-9b0e-13a3a9e97384" | head -n 1)"
		destDirName="${destDirName#*\"}"
		destDirName="${destDirName%%\"*}"
		if [[ -z "$destDirName" ]]; then
			destDirName="$(cat install.rdf | sed 's/\r/\n/g' | grep "<em:id>" | grep -v "ec8030f7-c20a-464f-9b0e-13a3a9e97384" | head -n 1)"
			destDirName="${destDirName#*>}"
			destDirName="${destDirName%%<*}"
		fi
		if [[ -z "$destDirName" ]]; then
			destDirName="$(cat install.rdf | sed 's/\r/\n/g' | grep "<id>" | grep -v "ec8030f7-c20a-464f-9b0e-13a3a9e97384" | head -n 1)"
			destDirName="${destDirName#*>}"
			destDirName="${destDirName%%<*}"
		fi
	else
		destDirName="$(cat manifest.json | grep "\"id\":" | grep -v "ec8030f7-c20a-464f-9b0e-13a3a9e97384" | head -n 1)"
		destDirName="${destDirName#*: \"}"
		destDirName="${destDirName%%\",*}"
	fi
	insinto "/usr/$(get_libdir)/firefox/browser/extensions/$destDirName"
	doins -r ./
}

EXPORT_FUNCTIONS src_install
