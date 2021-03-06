# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# @ECLASS: moz-ext.eclass
# @MAINTAINER: kolubat@gmail.com
# @BLURB: generic ebuild for Mozilla plugins

if [[ -z "$mozName" ]]; then
	mozName="${PN/moz-ext-/}"
fi
mozName="${mozName//-/_}"

if [[ -z "$addonPv" ]]; then
	addonPv="${PV}"
fi

SLOT="0"

REQUIRED_USE+=$'\n|| ( '
for app in "${mozApps[@]}"; do
	appString="$appString+$app"
	case $app in
	fx)
		IUSE+=" firefox"
		REQUIRED_USE+=" firefox"
		DEPEND+=" firefox? ( www-client/firefox )"
		;;
	fx-linux)
		IUSE+=" firefox"
		REQUIRED_USE+=" firefox"
		DEPEND+=" firefox? ( www-client/firefox )"
		;;
	sm)
		IUSE+=" seamonkey"
		REQUIRED_USE+=" seamonkey"
		DEPEND+=" seamonkey? ( www-client/seamonkey )"
		;;
	tb)
		IUSE+=" thunderbird"
		REQUIRED_USE+=" thunderbird"
		DEPEND+=" thunderbird? ( mail-client/thunderbird )"
		;;
	tb-linux)
		IUSE+=" thunderbird"
		REQUIRED_USE+=" thunderbird"
		DEPEND+=" thunderbird? ( mail-client/thunderbird )"
		;;
	*)
		true
		;;
	esac
done
REQUIRED_USE+=' )'

if [[ -n "$mozId" ]]; then
	SRC_URI="https://addons.mozilla.org/firefox/downloads/file/$mozId/${mozName}-${addonPv}-$appString.xpi -> ${P}.zip"
fi

S="${WORKDIR}"

moz-ext_src_install() {
	if [[ -z "$destDirName" ]]; then
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
			destDirName="${destDirName%%\"*}"
		fi
	fi
	for app in "${mozApps[@]}"; do
		case $app in
		fx)
			if use firefox; then
				insinto "/usr/$(get_libdir)/firefox/browser/extensions/$destDirName"
				doins -r ./
			fi
			;;
		fx-linux)
			if use firefox; then
				insinto "/usr/$(get_libdir)/firefox/browser/extensions/$destDirName"
				doins -r ./
			fi
			;;
		sm)
			if use seamonkey; then
				insinto "/usr/$(get_libdir)/seamonkey/browser/extensions/$destDirName"
				doins -r ./
			fi
			;;
		tb)
			if use thunderbird; then
				insinto "/usr/$(get_libdir)/thunderbird/extensions/$destDirName"
				doins -r ./
			fi
			;;
		tb-linux)
			if use thunderbird; then
				insinto "/usr/$(get_libdir)/thunderbird/extensions/$destDirName"
				doins -r ./
			fi
			;;
		*)
			echo "(Not installing for unknown Mozilla app $app)"
			;;
		esac
	done
}

EXPORT_FUNCTIONS src_install
