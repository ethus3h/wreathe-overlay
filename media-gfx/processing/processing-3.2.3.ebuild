# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="6"
inherit java-pkg-2

DESCRIPTION="an open source programming language and environment for people who want to program images, animation, and sound"
HOMEPAGE="http://processing.org/"
SRC_URI="https://github.com/${PN}/${PN}/archive/${PN}-0255-${PV}.tar.gz"

LICENSE="GPL-2 LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=virtual/jdk-1.5
	dev-java/antlr
	dev-java/eclipse-ecj
	dev-java/jna"
RDEPEND="${DEPEND}
	x11-misc/xdg-utils"

QA_EXECSTACK="usr/share/processing/libraries/serial/library/librxtxSerial.so"

src_prepare() {
	cd build/linux || die
	mkdir work || die

	# make.sh
	cp -r ../shared/lib work/ || die
	cp -r ../shared/libraries work/ || die
	cp -r ../shared/tools work/ || die

	java-pkg_jar-from --into work/lib/ antlr
	java-pkg_jar-from --into work/lib/ "eclipse-$(eselect ecj show)"
	java-pkg_jar-from --into work/lib/ jna

	unzip -q -d work ../shared/examples.zip || die
	unzip -q -d work ../shared/reference.zip || die

	cp -r ../../net work/libraries/ || die
	cp -r ../../opengl work/libraries/ || die
	cp -r ../../serial work/libraries/ || die
	cp -r ../../video work/libraries/ || die
	cp -r ../../pdf work/libraries/ || die
	cp -r ../../dxf work/libraries/ || die

	install -m 755 dist/processing work/processing || die

	sed -i -e '/^browser.linux/s:mozilla:xdg-open:' work/lib/preferences.txt || die

	ln -s "${JAVA_HOME}" work/java || die

	find work \( -name .svn -o -name .DS_Store \) -print0 | xargs -0 rm -rf || die
}

src_compile() {
	cd build/linux || die
	./make.sh || die
}

src_install() {
	cd build/linux/work || die

	java-pkg_addcp '$(java-config --tools)'
	java-pkg_dojar lib/*.jar

	rm -rf lib/*.jar
	insinto "${JAVA_PKG_JARDEST}"
	doins -r lib/*

	#for jar in $(find libraries -name '*.jar') ; do
	#	java-pkg_jarinto "${JAVA_PKG_SHAREPATH}/$(dirname ${jar})"
	#	java-pkg_dojar "${jar}"
	#	rm "${jar}"
	#done
	libopts -m0755
	for lib in $(find libraries -name '*.so') ; do
		java-pkg_sointo "${JAVA_PKG_SHAREPATH}/$(dirname ${lib})"
		java-pkg_doso "${lib}"
		rm "${lib}"
	done

	insinto "${JAVA_PKG_SHAREPATH}"
	doins -r libraries examples

	#java-pkg_doexamples examples/*
	#dosym /usr/share/doc/${PF}/examples "${JAVA_PKG_SHAREPATH}/examples"

	java-pkg_dohtml reference/*
	dosym /usr/share/doc/${PF}/html "${JAVA_PKG_SHAREPATH}/reference"

	java-pkg_dolauncher ${PN} --main processing.app.Base --pwd "${JAVA_PKG_SHAREPATH}"
}
