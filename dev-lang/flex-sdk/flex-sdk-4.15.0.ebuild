# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=4

WANT_ANT_TASKS="ant-nodeps ant-contrib"

inherit eutils java-pkg-2 java-ant-2 nsplugins

DESCRIPTION="The open-source framework for building expressive web and mobile applications."
HOMEPAGE="http://flex.apache.org/"

SRC_URI="http://www.apache.org/dyn/closer.lua/flex/4.15.0/apache-flex-sdk-4.15.0-src.tar.gz
	doc? (
		http://www.apache.org/dyn/closer.lua/flex/4.15.0/docs/apache-flex-sdk-4.15.0-asdocs.zip
	)"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="doc samples source +adobe_xerces"

RESTRICT="strip"

CDEPEND="
	>=dev-java/ant-core-1.7
	dev-java/bcel
	dev-java/commons-collections
	dev-java/commons-discovery
	dev-java/commons-logging
	dev-java/javacc
	dev-java/jflex
	dev-java/xalan
	!adobe_xerces? ( >=dev-java/xerces-2 )
	"

DEPEND="virtual/jdk
	${CDEPEND}"
RDEPEND="virtual/jre
	${CDEPEND}"

EANT_DOC_TARGET=
EANT_EXTRA_ARGS="
	-Drelease=\"Flex ${SLOT}\"
	-Drelease.version=${PV%.*}
	-Dbuild.number=${PV##*.}"

java_prepare() {
	cd "${S}/lib"

	ADOBE_JARS="license.jar"

	# custom batik and velocity are open in trunk (4.0) but not in 3.0.*
	ADOBE_JARS="$(echo batik*.jar) ${ADOBE_JARS} "
	ADOBE_JARS="$(velocity-*.jar) ${ADOBE_JARS}"

	ewarn It is possible that compile-time MXML error
	ewarn reporting and component debugging may not give correct line numbers.

	rm * || die

	java-pkg_jarfrom commons-collections
	java-pkg_jarfrom commons-discovery
	java-pkg_jarfrom commons-logging
	java-pkg_jarfrom javacc
	java-pkg_jarfrom xalan

	if ! use adobe_xerces; then
		java-pkg_jarfrom xerces-2
	fi

	for jar in ${ADOBE_JARS}; do
		mv "../$jar" . || die "failed to restore adobe's $jar"
	done

	# antTasks has no classpath set
	java-ant_rewrite-classpath "${S}/modules/antTasks/build.xml"

	# trimmed down ASC source is bundled from tamarin
	cd "${S}/modules/asc/build/java/lib"
	rm * || die
	java-pkg_jarfrom bcel

	# linux wrapper scripts for abcdump, ash, swfdump are not provided
	for unprovided in ash abcdump swfdump; do
		sed s.lib/asc.lib/${unprovided}. "${S}/bin/asc" > "${S}/bin/${unprovided}"
		chmod 755 "${S}/bin/${unprovided}"
	done

	if use doc; then
		cd "${WORKDIR}"
		unpack ${A}
	fi
}

src_compile() {
	einfo Building slimmed-down ASC

	EANT_BUILD_XML="${S}/modules/asc/build/java/build.xml"
	java-pkg-2_src_compile || die "failed to build actionscript compiler"
	cp "${S}/modules/asc/lib/"*.jar "${S}/lib/" || die "failed to move asc jars"

	einfo Building antTasks

	EANT_GENTOO_CLASSPATH="ant-core"
	EANT_BUILD_XML="${S}/modules/antTasks/build.xml"
	java-pkg-2_src_compile || die "failed to build ant tasks"

	einfo Building Flex SDK

	EANT_BUILD_XML="${S}/build.xml"
	EANT_BUILD_TARGET="main"
	java-pkg-2_src_compile || die "failed to build flex sdk"
}

src_install() {
	dodoc README.txt
	dohtml collateral/en_US/*
	dodoc modules/compiler/flex_compiler_api_guide.pdf

	rm bin/*.exe bin/*.bat

	if ! use source; then
		rm -rf frameworks/projects
	fi
	rm -rf frameworks/projects/*/asdoc
	rm -rf frameworks/tests

	INSTALL="flex-sdk-description.xml bin lib frameworks asdoc"

	if use samples; then
		INSTALL="${INSTALL} samples"
	fi

	FLEX_HOME=/usr/lib/${PN}-${SLOT}
	dodir ${FLEX_HOME}
	cp -pPr ${INSTALL} "${D}/${FLEX_HOME}/" || die "failed to install sdk"

	envfile=50${PN}
	#echo "FLEX_HOME=\"${FLEX_HOME}\"" >> ${envfile}
	echo "PATH=\"${FLEX_HOME}/bin\"" >> ${envfile}
	doenvd ${envfile}

	if use doc; then
		docinto html/langref
		unzip "${WORKDIR}/apache-flex-sdk-4.15.0-asdocs.zip"
		dohtml -r "${WORKDIR}/apache-flex-sdk-4.15.0-asdocs/"
		rm -rf "${WORKDIR}/apache-flex-sdk-4.15.0-asdocs/"
		docinto ""
		dodoc "${WORKDIR}/apache-flex-sdk-4.15.0-asdocs/"*
	fi
}

pkg_postinst() {
	einfo "Please source /etc/profile"
}
