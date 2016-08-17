# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="6"

inherit git-r3

DESCRIPTION="Opensnap brings the Aero Snap feature to Openbox."
HOMEPAGE="https://github.com/lawl/opensnap"
EGIT_REPO_URI="git://github.com/lawl/opensnap.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
RDEPEND="x11-misc/wmctrl
        x11-libs/libX11
        x11-libs/gtk+:3"

DEPEND="${RDEPEND}"

src_install() {
    exeinto /usr/bin/
    doexe bin/opensnap
    insinto /etc/opensnap/
    GLOBIGNORE=".git"
    doins sample_configs/*
    unset GLOBIGNORE
}
