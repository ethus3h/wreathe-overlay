# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="6"

inherit eutils git-r3

DESCRIPTION="JD-GUI, a standalone graphical utility that displays Java sources from CLASS files."
HOMEPAGE="http://jd.benow.ca/"
EGIT_REPO_URI="git://github.com/nx111/jd-gui.git"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64 -*"
RDEPEND="virtual/jdk"
DEPEND="${RDEPEND}"

S="${WORKDIR}/${PN}-git-46ea4b931f1760c9ece3ac418a5073d4336f2e3a"

src_unpack() {
    unpack ${A}
    cd "${S}"
    epatch "${FILESDIR}/e22055cdb208eab43665f163c75d2cd410d6530f.patch"
    epatch "${FILESDIR}/fcee004b81a010a94de71f0f0b09b4cbbbf91d9e.patch"
}

src_compile() {
    ./gradlew build
}
