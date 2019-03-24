# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3

# The following value is all that differs from the main EITE ebuild
isWasmToolchainBuild="false"

myUnicodeVersion="12.0.0"

myEmscriptenCommit="99d6e92d6c823bfc38199eceb5a8c32bd2bd7088"
myBinaryenVersion="68"

myWabtVersion="1.0.10"
myGoogletestVersion="1.8.1"
myPlyVersion="3.11"
myTestsuiteCommit="89cc463fa1251449d7974086a34ef0dc100b1582"

DESCRIPTION="The Ember Information Technology Environment"
HOMEPAGE="https://futuramerlin.com/"
EGIT_REPO_URI="https://github.com/ethus3h/ember-information-technology-environment.git"
SRC_URI=""
# Unicode
SRC_URI="${SRC_URI} https://www.unicode.org/Public/"${myUnicodeVersion}"/ucdxml/ucd.all.flat.zip -> ucd.all.flat-${myUnicodeVersion}.zip"
# EITE WASM components
# Emscripten:
SRC_URI="${SRC_URI} https://github.com/emscripten-core/emscripten/archive/${myEmscriptenCommit}.tar.gz -> emscripten-${myEmscriptenCommit}.tar.gz
	https://github.com/WebAssembly/binaryen/archive/version_${myBinaryenVersion}.tar.gz -> binaryen-${myBinaryenVersion}.tar.gz
	https://github.com/WebAssembly/binaryen/archive/version_${myBinaryenVersion}.zip -> binaryen-${myBinaryenVersion}.zip"
# WABT:
SRC_URI="${SRC_URI} https://github.com/WebAssembly/wabt/archive/${myWabtVersion}.tar.gz -> wabt-${myWabtVersion}.tar.gz
	https://github.com/google/googletest/archive/release-${myGoogletestVersion}.tar.gz -> googletest-${myGoogletestVersion}.tar.gz
	https://github.com/dabeaz/ply/archive/${myPlyVersion}.tar.gz -> python-lex-yacc-${myPlyVersion}.tar.gz
	https://github.com/WebAssembly/testsuite/archive/${myTestsuiteCommit}.tar.gz -> WebAssembly-testsuite-${myTestsuiteCommit}.tar.gz"

LICENSE="AGPL-3+ GPL-2+ GPL-3 BSD MIT UoI-NCSA MPL-2.0 OFL-1.1 public-domain"
SLOT="0"
IUSE="doc"
KEYWORDS=""
RDEPEND="app-misc/wreathe-meta
	app-misc/futuramerlin-web-toolkit
	dev-javascript/PapaParse
	dev-util/wabt
	virtual/perl6
	sys-devel/clang[llvm_targets_WebAssembly]
	sys-devel/lld
	>=sys-libs/libcxx-8"
if [[ "true" == "$isWasmToolchainBuild" ]]; then
	# EITE WASM component build-time dependencies
	# wabt dependencies, as of the version used for EITE WASM build:
	RDEPEND="${RDEPEND}
		dev-util/re2c
		dev-lang/python
		dev-util/cmake
		sys-devel/clang[llvm_targets_WebAssembly]
		sys-devel/lld
		virtual/jdk
		sys-apps/moreutils
		net-libs/nodejs"
else
	RDEPEND="${RDEPEND}
		=app-misc/eite-wasm-toolchain-${PV}"
fi
DEPEND="${RDEPEND}"

eiteEbuildDistfileCopy() {
	cp "${DISTDIR}/$1" "${S}/build-temp/distfiles/" || die
}

src_prepare() {
	default
	rm -rf "${S}/build-temp/distfiles" || die
	mkdir -p "${S}/build-temp/distfiles" || die
	# Code shared with dist-fetch
	eiteEbuildDistfileCopy "ucd.all.flat-${myUnicodeVersion}.zip"
	eiteEbuildDistfileCopy "emscripten-${myEmscriptenCommit}.tar.gz"
	eiteEbuildDistfileCopy "binaryen-${myBinaryenVersion}.tar.gz"
	eiteEbuildDistfileCopy "binaryen-${myBinaryenVersion}.zip"
	eiteEbuildDistfileCopy "wabt-${myWabtVersion}.tar.gz"
	eiteEbuildDistfileCopy "googletest-${myGoogletestVersion}.tar.gz"
	eiteEbuildDistfileCopy "python-lex-yacc-${myPlyVersion}.tar.gz"
	eiteEbuildDistfileCopy "WebAssembly-testsuite-${myTestsuiteCommit}.tar.gz"
}

src_compile() {
	if [[ "true" == "$isWasmToolchainBuild" ]]; then
		emake wasm-toolchain
	else
		default
	fi
}

src_install() {
	if [[ "true" == "$isWasmToolchainBuild" ]]; then
		emake DESTDIR="${D}" wasm-toolchain-install
	else
		default
	fi
}
