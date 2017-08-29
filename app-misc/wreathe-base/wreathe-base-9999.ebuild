# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

if [[ "${PV}" == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/ethus3h/${PN}.git"
	KEYWORDS=""
else
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
		rm -rv "${S}/build/onscreen-keyboard/onboard-emoji"
		mv "${WORKDIR}/onboard-emoji-$onboardEmojiRevision" "${S}/build/onscreen-keyboard/onboard-emoji"
	fi
	eapply_user
	rm -rv var/lib/portage
}

src_install() {
	rm -r .git .gitmodules build
	GLOBIGNORE="README.md:.git:.gitattributes:.gitconfig:usr:man:Makefile:build:.egup.tags:Wreathe"
	insinto /
	doins -r ./*

	fperms +x /etc/bash/bashrc.d/wreathe.sh

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
	fperms +x /etc/bash/bashrc.d/wreathe.sh
}
