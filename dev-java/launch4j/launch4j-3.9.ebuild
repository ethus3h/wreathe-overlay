# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="6"

inherit java-ant-2

DESCRIPTION="Cross-platform Java executable wrapper"
HOMEPAGE="http://jd.benow.ca/"
SRC_URI="mirror://sourceforge/code-snapshots/git/l/la/launch4j/git.git/launch4j-git-46ea4b931f1760c9ece3ac418a5073d4336f2e3a.zip"
LICENSE="BSD MIT"
SLOT="0"
KEYWORDS="~amd64 -*"
RDEPEND="virtual/jdk"
DEPEND="${RDEPEND}"

S="${WORKDIR}/${PN}-git-46ea4b931f1760c9ece3ac418a5073d4336f2e3a"
