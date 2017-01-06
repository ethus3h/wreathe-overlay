# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="6"

inherit git-r3

DESCRIPTION="Wreathe"
HOMEPAGE="https://futuramerlin.com/"
EGIT_REPO_URI="git://github.com/ethus3h/wreathe.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 -*"
#RDEPEND="app-misc/wreathe-overlays"

src_prepare() {
	eapply_user
	rm -rv boot.disabled
}

src_install() {
	GLOBIGNORE="README.md:.git:.gitattributes:.gitconfig:usr:man:Makefile:build:.egup.tags:Wreathe"
	insinto /
	doins -r *

	GLOBIGNORE="usr/bin"
	insinto /usr/
	doins -r usr/*

	unset GLOBIGNORE
	exeinto /usr/bin/
	doexe usr/bin/*

	GLOBIGNORE="Wreathe/.Resources"
	insinto /Wreathe/
	doins -r Wreathe/*

	GLOBIGNORE="Wreathe/.Resources/7r2-Compatibility:Wreathe/.Resources/Scripts"
	insinto /Wreathe/.Resources/
	doins -r Wreathe/.Resources/*

	unset GLOBIGNORE
	exeinto /Wreathe/.Resources/Scripts/
	doexe Wreathe/.Resources/Scripts/*

	GLOBIGNORE="Wreathe/.Resources/7r2-Compatibility/Scripts"
	insinto /Wreathe/.Resources/7r2-Compatibility/
	doins -r Wreathe/.Resources/7r2-Compatibility/* || echo "Note: no additional 7r2 compatibility files installed"

	unset GLOBIGNORE
	exeinto /Wreathe/.Resources/7r2-Compatibility/Scripts/
	doexe Wreathe/.Resources/7r2-Compatibility/Scripts/*

	unset GLOBIGNORE

	doman man/*

	# Provide gmcs as an alias for the mcs compiler for Mono
	dosym /usr/bin/mcs /usr/bin/gmcs

	# Make php-cgi command available
	phpfile=$(file /usr/bin/php)
	cgifile="$(echo -n "$phpfile" | perl -p -e 's/\/usr\/bin\/php: symbolic link to \/(.+)\/php([\d\.]+)\/bin\/php/\/$1\/php$2\/bin\/php-cgi/g')"
	dosym "$cgifile" /usr/bin/php-cgi
}
