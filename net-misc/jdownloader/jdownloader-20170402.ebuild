# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

inherit java-pkg-2 java-ant-2

DESCRIPTION="Platform Independent Tool to Download Files from One-Click-Hosting Sites"
HOMEPAGE="http://jdownloader.org"
SRC_URI="https://github.com/ethus3h/jdownloader/archive/v20170402.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-java/ant
	>=virtual/jdk-1.5"
RDEPEND=">=virtual/jre-1.5"

EANT_BUILD_XML="build/newBuild/build.xml"
EANT_BUILD_TARGET="withoutsign"

src_prepare() {
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
