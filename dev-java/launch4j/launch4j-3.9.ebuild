# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="6"

inherit java-pkg-2 java-ant-2

DESCRIPTION="Cross-platform Java executable wrapper"
HOMEPAGE="http://jd.benow.ca/"
SRC_URI="mirror://sourceforge/code-snapshots/git/l/la/launch4j/git.git/launch4j-git-46ea4b931f1760c9ece3ac418a5073d4336f2e3a.zip"
#To quote the project's Web site: "This program is free software licensed under the BSD 3-Clause License, the head subproject (the code which is attached to the wrapped jars) is licensed under the MIT License. Launch4j may be used for wrapping closed source, commercial applications."
LICENSE="BSD MIT"
SLOT="0"
KEYWORDS="~amd64 -*"
RDEPEND="virtual/jdk"
DEPEND="${RDEPEND}"

S="${WORKDIR}/${PN}-git-46ea4b931f1760c9ece3ac418a5073d4336f2e3a"
