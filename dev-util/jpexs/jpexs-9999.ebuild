# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

inherit eutils git-r3

DESCRIPTION="Flash SWF decompiler and editor"
HOMEPAGE="https://www.free-decompiler.com/"
EGIT_REPO_URI="https://github.com/jindrapetrik/jpexs-decompiler.git"
LICENSE="AGPL-3"
SLOT="0"
KEYWORDS=""
RDEPEND="virtual/jdk:=
	dev-java/jflex
	dev-java/jna:=
	dev-java/lzma
	dev-java/tablelayout
	dev-java/trident
"
# dev-java/avi
# dev-java/cmykjpeg
# dev-java/flamingo
# dev-java/flashdebugger
# dev-java/gif
# dev-java/gnupdf
# dev-java/javactivex
# dev-java/jl
# dev-java/jpacker
# dev-java/jpproxy
# dev-java/jsyntaxpane
# dev-java/nellymoser
# dev-java/sfntly
# dev-java/substance
# dev-java/substance-flamingo
# dev-java/treetable
# dev-java/ttf

DEPEND="${RDEPEND}"

src_compile() {
	ant build
}

src_install() {
	insinto /usr/share/${PN}-${SLOT}/lib/
	doins -r *
}
