# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="6"

inherit git-r3

DESCRIPTION="Wreathe"
HOMEPAGE="https://futuramerlin.com/"
EGIT_REPO_URI="git://github.com/ethus3h/wreathe.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 -*"
RDEPEND=""

src_prepare() {
    eapply_user
    rm -r boot.disabled
}

src_install() {
    insinto /
    GLOBIGNORE="README.md:.git:usr:man"
    doins -r ./*
    insinto /usr/
    GLOBIGNORE="bin"
    doins -r usr/*
    unset GLOBIGNORE
    exeinto /usr/bin/
    doexe usr/bin/*
    doman man/*
    # Provide gmcs as an alias for the mcs compiler for Mono
    dosym /usr/bin/mcs /usr/bin/gmcs
    # Make php-cgi command available
    phpfile=$(file /usr/bin/php)
    cgifile="$(echo -n "$phpfile" | sed 's/\/usr\/bin\/php: symbolic link to \/(.+)\/php([\d\.]+)\/bin\/php/\/\1\/php\2\/php-cgi/g')"
    dosym /usr/bin/php-cgi "$cgifile"
}
