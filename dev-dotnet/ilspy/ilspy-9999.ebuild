# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="6"

inherit git-r3

DESCRIPTION="ILSpy command line decompiler for Mono"
HOMEPAGE="https://github.com/aerror2/ILSpy-For-MacOSX"
EGIT_REPO_URI="git://github.com/aerror2/ILSpy-For-MacOSX.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 -*"
RDEPEND="dev-lang/mono"
DEPEND="${RDEPEND}"

src_compile() {
	xbuild ILSpyMac.sln
}

src_install() {
	insinto /Wreathe/Apps/ILSpy/
	GLOBIGNORE="README.md:.git"
	doins -r *
	unset GLOBIGNORE
	exeinto /usr/bin/
	echo '#!/bin/bash' > ./ilspy
	echo 'mono /Wreathe/Apps/ILSpy/ILSpyMac/bin/Debug/ILSpyMac.exe $@' > ./ilspy
	doexe ilspy
}
