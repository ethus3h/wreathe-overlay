# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"
JAVA_PKG_IUSE="source"
WANT_ANT_TASKS="ant-nodeps"

inherit java-pkg-2 java-ant-2

DESCRIPTION="A library that implements the SSH2 protocol in pure Java"
HOMEPAGE="http://www.trilead.com/Products/Trilead_SSH_for_Java/"
SRC_URI="http://http.debian.net/debian/pool/main/t/${PN}/${PN}_6401+svn158.orig.tar.xz -> ${P}.tar.xz"
KEYWORDS="~amd64 ~x86"
SLOT="0"
LICENSE="BSD MIT"
IUSE=""

DEPEND=">=virtual/jdk-1.4"
RDEPEND=">=virtual/jre-1.4"

S="${WORKDIR}/${PN}"

EANT_BUILD_TARGET="trilead-ssh2.jar"

src_prepare() {
	default

	find . -name "*.jar" -delete
	# ganymed does not provide its own build files so we took the ones from here:
	# http://debian-eclipse.wfrag.org/tracpy/browser/ganymed-ssh2/trunk
	cp "${FILESDIR}/${P}"-debian-build.xml "${S}"/build.xml || die "Cannot copy build.xml"
	cp "${FILESDIR}/${P}"-debian-build.properties "${S}"/build.properties || die "Cannot copy build.properties"
}

src_install() {
	java-pkg_dojar "build/lib/${EANT_BUILD_TARGET}"
	use source && java-pkg_dosrc src
}
