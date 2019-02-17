# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3

myEmscriptenCommit="99d6e92d6c823bfc38199eceb5a8c32bd2bd7088"
myBinaryenVersion="68"

myLlvmCommit="c39f8dfa7317f10923cf5ab2d650adde1abaa612"

myWabtVersion="1.0.8"
myGoogletestVersion="1.8.1"
myPlyVersion="3.11"
myTestsuiteCommit="89cc463fa1251449d7974086a34ef0dc100b1582"

DESCRIPTION="The Ember Information Technology Environment"
HOMEPAGE="https://futuramerlin.com/"
EGIT_REPO_URI="https://github.com/ethus3h/ember-information-technology-environment.git"
SRC_URI=""
# EITE WASM components
# Emscripten:
SRC_URI="${SRC_URI} https://github.com/emscripten-core/emscripten/archive/${myEmscriptenCommit}.tar.gz -> emscripten-${myEmscriptenCommit}.tar.gz
	https://github.com/WebAssembly/binaryen/archive/version_${myBinaryenVersion}.tar.gz -> binaryen-${myBinaryenVersion}.tar.gz
	https://github.com/WebAssembly/binaryen/archive/version_${myBinaryenVersion}.zip -> binaryen-${myBinaryenVersion}.zip"
# LLVM:
SRC_URI="${SRC_URI} https://github.com/llvm/llvm-project/archive/${myLlvmCommit}.tar.gz -> llvm-project-${myLlvmCommit}.tar.gz"
# WABT:
SRC_URI="${SRC_URI} https://github.com/WebAssembly/wabt/archive/${myWabtVersion}.tar.gz -> wabt-${myWabtVersion}.tar.gz
	https://github.com/google/googletest/archive/release-${myGoogletestVersion}.tar.gz -> googletest-${myGoogletestVersion}.tar.gz
	https://github.com/dabeaz/ply/archive/${myPlyVersion}.tar.gz -> python-lex-yacc-${myPlyVersion}.tar.gz
	https://github.com/WebAssembly/testsuite/archive/${myTestsuiteCommit}.tar.gz -> WebAssembly-testsuite-${myTestsuiteCommit}.tar.gz"

LICENSE="AGPL-3"
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
# EITE WASM component build-time dependencies
# wabt dependencies, as of the version used for EITE WASM build:
RDEPEND="${RDEPEND}
	dev-util/re2c
	dev-lang/python
	dev-util/cmake
	sys-devel/clang[llvm_targets_WebAssembly]
	sys-devel/lld
	sys-apps/moreutils
	net-libs/nodejs"
DEPEND="${RDEPEND}"

eiteEbuildDistfileCopy() {
	cp "${DISTDIR}/$1" "${S}/build-temp/distfiles/"
}

src_unpack() {
	default
	mkdir "${S}/build-temp/distfiles"
	# Code based on dist-build
	eiteEbuildDistfileCopy emscripten-"$myEmscriptenCommit".tar.gz
	eiteEbuildDistfileCopy binaryen-"$myBinaryenVersion".tar.gz
	eiteEbuildDistfileCopy binaryen-"$myBinaryenVersion".zip
	eiteEbuildDistfileCopy wabt-"$myWabtVersion".tar.gz
	eiteEbuildDistfileCopy googletest-"$myGoogletestVersion".tar.gz
	eiteEbuildDistfileCopy python-lex-yacc-"$myPlyVersion".tar.gz
	eiteEbuildDistfileCopy WebAssembly-testsuite-"$myTestsuiteCommit".tar.gz
}
