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

LICENSE="AGPL-3"
SLOT="0"
IUSE="doc"
KEYWORDS=""
RDEPEND="dev-util/re2c
	sys-devel/clang[llvm_targets_WebAssembly]
	sys-devel/lld"
DEPEND="${RDEPEND}"

src_prepare() {
	einfo "Satisfying build-time dependency on QMLTermWidget by linking it into the source tree..."
	rmdir "${WORKDIR}/${P}/qmltermwidget" || die "Error deleting empty widget dir from source tree"
	ln -s "${WORKDIR}/qmltermwidget-0.1.0" "${WORKDIR}/${P}/qmltermwidget" || die "Error linking widget into source tree"
	use remember && {
		einfo "Applying 3rd party patch from GH PR #303"
		epatch "${FILESDIR}/size_and_position.patch" || die "could not apply patch"
	}
}

src_configure() {
	einfo "Preparing targets..."
	eqmake5 || die "Failed to configure"
}
