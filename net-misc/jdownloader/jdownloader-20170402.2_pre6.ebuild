# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit java-pkg-2 java-ant-2

DESCRIPTION="Platform Independent Tool to Download Files from One-Click-Hosting Sites"
HOMEPAGE="http://jdownloader.org"
SRC_URI="https://github.com/ethus3h/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="dev-java/ant
	>=virtual/jdk-1.5:*
	dev-java/svnkit
	dev-java/svgsalamander
	dev-java/miglayout
	dev-java/jackson
	dev-java/jackson-databind
	dev-java/jackson-annotations"
DEPEND="${RDEPEND}
	>=virtual/jre-1.5"

EANT_BUILD_XML="build/newBuild/build.xml"
EANT_BUILD_TARGET="withoutsign"

src_prepare() {
	default
	rsync -av overlay/* .
}

src_compile() {
	#cd "${S}/appwork-utils"
	#java-pkg-2_src_compile
	#cd "${S}/appwork-updclient"
	#java-pkg-2_src_compile
	#cd "${S}/jd-browser"
	#java-pkg-2_src_compile
	cd "${S}/jdownloader"
	java-pkg-2_src_compile
}
