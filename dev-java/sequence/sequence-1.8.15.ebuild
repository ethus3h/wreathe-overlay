# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"
JAVA_PKG_IUSE="doc source"
inherit eutils versionator java-pkg-2 java-ant-2

DESCRIPTION="Helper library for SVNKit"
HOMEPAGE="http://svnkit.com/"
SRC_URI="http://www.svnkit.com/org.tmatesoft.svn_${PV}.src.zip"
KEYWORDS="~amd64 ~x86"
SLOT="0"
LICENSE="Apache-1.1"
IUSE="test"

DEPEND=">=virtual/jdk-1.4
	test? ( dev-java/ant-junit )"

RDEPEND=">=virtual/jre-1.4"

S="${WORKDIR}/svnkit-${PV}"

EANT_BUILD_TARGET="jar"
EANT_DOC_TARGET="javadoc"

src_unpack() {
	unpack ${A}
	cd "${S}" || die
	cp "${FILESDIR}/${P}-build.xml" build.xml || die
	mkdir -p lib || die
}

src_install() {
	java-pkg_newjar "dist/${P}.jar" "${PN}.jar"

	use doc && java-pkg_dojavadoc dist/javadoc
	use source && java-pkg_dosrc src/*
}

src_test() {
	java-pkg_jar-from --into lib junit
	ANT_TASKS="ant-junit" eant test
}
