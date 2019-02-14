# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

myGoogletestVersion="1.8.1"
myPlyVersion="3.11"
myTestsuiteCommit="89cc463fa1251449d7974086a34ef0dc100b1582"

DESCRIPTION="The WebAssembly Binary Toolkit"
HOMEPAGE="https://github.com/WebAssembly/wabt"
SRC_URI="https://github.com/WebAssembly/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/google/googletest/archive/release-${myGoogletestVersion}.tar.gz -> googletest-${myGoogletestVersion}.tar.gz
	https://github.com/dabeaz/ply/archive/${myPlyVersion}.tar.gz -> python-lex-yacc-${myPlyVersion}.tar.gz
	https://github.com/WebAssembly/testsuite/archive/${myTestsuiteCommit}.tar.gz -> WebAssembly-testsuite-${myTestsuiteCommit}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
RDEPEND="dev-util/re2c
	dev-lang/python
	sys-devel/clang[llvm_targets_WebAssembly]
	sys-devel/lld"
DEPEND="${RDEPEND}"

src_prepare() {
	rm -r "${WORKDIR}/${P}/third_party" || die "Error deleting third-party code"
	rm -r "${WORKDIR}/${P}/src/prebuilt" || die "Error deleting pre-built code"
	mkdir "${WORKDIR}/${P}/third_party" || die "Error creating empty third_party directory"
	mkdir "${WORKDIR}/${P}/src/prebuilt" || die "Error creating empty src/prebuilt directory"
	mv "${WORKDIR}/googletest-release-${myGoogletestVersion}" "${WORKDIR}/${P}/third_party/gtest" || die "Error moving gtest"
	mv "${WORKDIR}/ply-${myPlyVersion}" "${WORKDIR}/${P}/third_party/ply" || die "Error moving ply"
	mv "${WORKDIR}/testsuite-${myTestsuiteCommit}" "${WORKDIR}/${P}/third_party/testsuite" || die "Error moving testsuite"
	default
}

src_configure() {
	make update-wasm2c || die "Error running make update-wasm2c"
	make update-re2c || die "Error running make update-re2c"
	default
}

src_compile() {
	emake VERBOSE=1
}
