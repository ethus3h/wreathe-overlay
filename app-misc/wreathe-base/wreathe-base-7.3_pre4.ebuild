# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

if [[ "${PV}" == "9999" ]]; then
	inherit git-r3 xdg-utils
	EGIT_REPO_URI="https://github.com/ethus3h/${PN}.git"
	KEYWORDS=""
else
	inherit xdg-utils
	onboardEmojiRevision="47314d5aff654d8e315552fb106cf82508915747"
	SRC_URI="https://github.com/ethus3h/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz
		https://github.com/qnub/onboard-emoji/archive/$onboardEmojiRevision.zip -> onboard-emoji-git-$onboardEmojiRevision.zip"
	KEYWORDS="~amd64"
fi

DESCRIPTION="Wreathe"
HOMEPAGE="https://futuramerlin.com/"
LICENSE="AGPL-3"
SLOT="0"

RDEPEND="app-misc/ember-shared"

src_prepare() {
	if [[ "${PV}" != "9999" ]]; then
		rm -rv "${S}/build/onscreen-keyboard/onboard-emoji" || die
		mv "${WORKDIR}/onboard-emoji-$onboardEmojiRevision" "${S}/build/onscreen-keyboard/onboard-emoji"
	fi
	default
	rm -r ./*.md .git .gitmodules .egup.* || die
	# Not needed to be installed
	rm -r debian-package-generate || die
	rm -rv Makefile var || die
	# Provided by wreathe-base-special
	rm -rv ./etc/sandbox.d ./etc/security ./etc/modules-load.d || die
}

src_install() {
	rm -r build || die
	GLOBIGNORE="README.md:.git:.gitattributes:.gitconfig:usr:Makefile:build:.egup.tags:Wreathe"
	insinto /
	doins -r ./*
	unset GLOBIGNORE

	fperms +x /etc/bash/bashrc.d/wreathe.sh

	dodoc usr/share/doc/wreathe-base/*
	rm -rv usr/share/doc

	doman usr/share/man/man1/*
	rm -rv usr/man

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

	# Provide symlinks to provide compatibility with not-yet-updated apps looking for Mono 2
	dosym /usr/bin/mcs /usr/bin/gmcs
	dosym /usr/bin/mono /usr/bin/cli

	# Make php-cgi command available
	phpfile=$(file /usr/bin/php)
	cgifile="$(echo -n "$phpfile" | perl -p -e 's/\/usr\/bin\/php: symbolic link to \/(.+)\/php([\d\.]+)\/bin\/php/\/$1\/php$2\/bin\/php-cgi/g')"
	dosym "$cgifile" /usr/bin/php-cgi

	fperms +x /etc/bash/bashrc.d/wreathe.sh
}

pkg_postinst() {
	xdg_desktop_database_update
}

pkg_postrm() {
	xdg_desktop_database_update
}
