# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

myGoogletestVersion="47314d5aff654d8e315552fb106cf82508915747"
myPlyVersion="47314d5aff654d8e315552fb106cf82508915747"
myTestsuiteCommit="47314d5aff654d8e315552fb106cf82508915747"

DESCRIPTION="The WebAssembly Binary Toolkit"
HOMEPAGE="https://github.com/WebAssembly/wabt"
SRC_URI="https://github.com/WebAssembly/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz
	"

LICENSE="AGPL-3"
SLOT="0"
IUSE="doc"
KEYWORDS=""
RDEPEND="sys-devel/clang[llvm_targets_WebAssembly]
	sys-devel/lld"
DEPEND="${RDEPEND}"
