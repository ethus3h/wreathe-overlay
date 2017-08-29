# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

inherit eutils git-r3

DESCRIPTION="Graphical Java CLASS file decompiler"
HOMEPAGE="http://jd.benow.ca/"
EGIT_REPO_URI="https://github.com/nx111/jd-gui.git"
#FIXME This app's buildsystem needs an Internet connection to download binaries! Plus this ebuild doesn't work.
LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64 -*"
RDEPEND="virtual/jdk:="

DEPEND="${RDEPEND}"

src_prepare() {
	eapply_user
	cd "${S}"
	epatch "${FILESDIR}/e22055cdb208eab43665f163c75d2cd410d6530f.patch"
	epatch "${FILESDIR}/fcee004b81a010a94de71f0f0b09b4cbbbf91d9e.patch"
}

src_compile() {
	./gradlew build
}

src_install() {
	insinto /usr/share/${PN}-${SLOT}/lib/
	doins -r *
}
