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
KEYWORDS=""

src_prepare() {
	eapply_user
	rm -rv boot.disabled
	rm -rv var/lib/portage
}

src_install() {
	GLOBIGNORE="README.md:.git:.gitattributes:.gitconfig:usr:man:Makefile:build:.egup.tags:Wreathe"
	insinto /
	doins -r *
	
	fperms +x /etc/bash/bashrc.d/wreathe
	fperms +x /etc/profile.d/wreathe

	GLOBIGNORE="usr/bin"
	insinto /usr/
	doins -r usr/*

	unset GLOBIGNORE
	dobin usr/bin/*

	GLOBIGNORE="Wreathe/.Resources"
	insinto /Wreathe/
	doins -r Wreathe/*

	GLOBIGNORE="Wreathe/.Resources/7r2-Compatibility:Wreathe/.Resources/Scripts"
	insinto /Wreathe/.Resources/
	doins -r Wreathe/.Resources/*

	unset GLOBIGNORE
	exeinto /Wreathe/.Resources/Scripts/
	find Wreathe/.Resources/Scripts/ -type f -maxdepth 1 -exec doexe {} \;
	insinto /Wreathe/.Resources/Scripts/
	find Wreathe/.Resources/Scripts/ -maxdepth 1 \! -type f -exec doins -r {} \;

	GLOBIGNORE="Wreathe/.Resources/7r2-Compatibility/Scripts"
	insinto /Wreathe/.Resources/7r2-Compatibility/
	find Wreathe/.Resources/7r2-Compatibility/ -maxdepth 1 \! -name "Scripts" -exec doins -r {} \;

	unset GLOBIGNORE
	exeinto /Wreathe/.Resources/7r2-Compatibility/Scripts/
	doexe Wreathe/.Resources/7r2-Compatibility/Scripts/*

	unset GLOBIGNORE

	doman man/*

	# Provide symlinks to provide compatibility with not-yet-updated apps looking for Mono 2
	dosym /usr/bin/mcs /usr/bin/gmcs
	dosym /usr/bin/mono /usr/bin/cli

	# Make php-cgi command available
	phpfile=$(file /usr/bin/php)
	cgifile="$(echo -n "$phpfile" | perl -p -e 's/\/usr\/bin\/php: symbolic link to \/(.+)\/php([\d\.]+)\/bin\/php/\/$1\/php$2\/bin\/php-cgi/g')"
	dosym "$cgifile" /usr/bin/php-cgi

	fperms +x /etc/git/hooks/pre-commit
}
