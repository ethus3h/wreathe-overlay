# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"
JAVA_PKG_IUSE="doc source"
inherit eutils versionator java-pkg-2 java-ant-2

DESCRIPTION="A pure Java Subversion client library"
HOMEPAGE="http://svnkit.com/"
SRC_URI="https://www.svnkit.com/org.tmatesoft.svn_${PV}.src.zip"
KEYWORDS="~amd64 ~x86"
SLOT="0"

LICENSE="tmate"
IUSE=""

DEPEND=">=dev-vcs/subversion-1.5[java]
	dev-java/trilead-ssh2
	=dev-java/sequence-${PV}
	dev-java/jna
	>=virtual/jdk-1.4"
RDEPEND="${DEPEND}
	>=virtual/jre-1.4"

EANT_BUILD_TARGET="build-library build-cli"
EANT_DOC_TARGET="build-doc"

src_unpack() {
	unpack ${A}
}

src_prepare() {
	epatch "${FILESDIR}/${P}-build.xml.patch"

	rm -r contrib/* || die
	java-pkg_jar-from --into contrib jna,trilead-ssh2,sequence:1.2,subversion
}

src_install() {
	cd build/lib || die
	java-pkg_dojar *.jar
	dodoc *.txt || die

	cd "${S}" || die
	use doc && java-pkg_dojavadoc build/doc/javadoc
	use source && java-pkg_dosrc svnkit/src/*
}
