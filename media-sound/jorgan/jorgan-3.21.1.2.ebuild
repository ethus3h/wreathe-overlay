# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit java-pkg-2 java-ant-2

DESCRIPTION="Java-based MIDI-Processor"
HOMEPAGE="https://github.com/ethus3h/jorgan"
SRC_URI="https://github.com/ethus3h/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3 LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="dev-java/ant
	>=virtual/jdk-1.6:*
	media-sound/awesfx
	app-misc/ember-shared"
DEPEND="${RDEPEND}
	>=virtual/jre-1.6"

EANT_BUILD_XML="build.xml"
EANT_BUILD_TARGET="all"

src_prepare() {
	(
		# shellcheck disable=SC1091
		source ember_bash_setup &> /dev/null
		ereplace "@version@" "${PV}" build.properties
		ereplace "@jdk@" "$JAVA_HOME" build.properties
		ereplace "@awesfx@" "/usr/include/awesfx" build.properties
	)
	default
}

src_compile() {
	java-pkg-2_src_compile
}

src_install() {
	(
		cd jorgan-package/src || die
		sed -i 's/\r//g' debian/install
		IFS=$'\n'
		shopt -s nullglob
		while read -r line; do
			item="$(awk '{print $1;}' <<< "$line" )"
			dest="$(awk '{print $2;}' <<< "$line" )"
			insinto "$dest"
			if [[ "$item" == *\* ]]; then
				files=("${item::-1}"*)
				for file in "${files[@]}"; do
					doins -r "$file"
				done
			else
				doins -r "$item"
			fi
		done <debian/install
	)
	fperms +x /usr/bin/jorgan
}

pkg_config() {
	jorgan-package/src/debian/input/postinst
}
