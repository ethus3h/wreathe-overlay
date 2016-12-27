# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="6"

inherit eutils git-r3

DESCRIPTION="Opensource flash SWF decompiler and editor. Extract resources, convert SWF to FLA, edit ActionScript, replace images, sounds, texts or fonts. Various output formats available."
HOMEPAGE="https://www.free-decompiler.com/"
EGIT_REPO_URI="git://github.com/jindrapetrik/jpexs-decompiler.git"
LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64 -*"
RDEPEND="virtual/jdk
    dev-java/jflex
    dev-java/trident
    dev-java/tablelayout
    dev-java/jna
    dev-java/lzma

    dev-java/treetable
    dev-java/ttf
    dev-java/substance
    dev-java/substance-flamingo
    dev-java/sfntly
    dev-java/nellymoser
    dev-java/jsyntaxpane
    dev-java/jpacker
    dev-java/jpproxy
    dev-java/jl
    dev-java/gnupdf
    dev-java/gif
    dev-java/flashdebugger
    dev-java/flamingo
    dev-java/cmykjpeg
    dev-java/avi
    dev-java/javactivex"

DEPEND="${RDEPEND}"

src_compile() {
    ant build
}

src_install() {
    insinto /usr/share/${PN}-${SLOT}/lib/
    doins -r *
}
