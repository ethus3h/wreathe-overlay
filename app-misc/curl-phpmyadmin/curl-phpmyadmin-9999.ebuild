# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="6"

inherit git-r3

DESCRIPTION="Export MySQL data from phpmyadmin using curl"
HOMEPAGE="https://github.com/speechkey/curl-phpmyadmin"
EGIT_REPO_URI="git://github.com/speechkey/${PN}.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 -*"
RDEPEND="net-misc/curl"

src_install() {
    exeinto /usr/bin/
    doexe mysql-export.sh
}
