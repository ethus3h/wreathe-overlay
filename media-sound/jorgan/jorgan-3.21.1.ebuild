# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

inherit java-pkg-2 java-ant-2

DESCRIPTION="Java-based MIDI-Processor"
HOMEPAGE="https://github.com/ethus3h/jorgan"
SRC_URI="https://github.com/ethus3h/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="dev-java/ant
	>=virtual/jdk-1.7:*
	media-sound/awesfx"
DEPEND="${RDEPEND}
	>=virtual/jre-1.7"

EANT_BUILD_XML="build.xml"
EANT_BUILD_TARGET="all"

src_prepare() {
	(
		# shellcheck disable=SC1091
		source ember_bash_setup &> /dev/null
		ereplace "@version@" "${PV}" build.properties
		ereplace "@jdk@" "$JAVA_HOME" build.properties
		ereplace "@awesfx@" "/usr/bin" build.properties
	)
}

src_compile() {
	java-pkg-2_src_compile
}
