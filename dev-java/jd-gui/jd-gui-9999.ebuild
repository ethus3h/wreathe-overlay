# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="6"

inherit git-r3

DESCRIPTION="JD-GUI, a standalone graphical utility that displays Java sources from CLASS files."
HOMEPAGE="http://jd.benow.ca/"
EGIT_REPO_URI="git://github.com/nx111/jd-gui.git"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64 -*"
RDEPEND="virtual/jdk"
DEPEND="${RDEPEND}"

src_compile() {
    ./gradlew build
}
