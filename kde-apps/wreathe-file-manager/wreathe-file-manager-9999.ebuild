# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_AUTODEPS="false"
inherit kde5 git-r3

DESCRIPTION="Wreathe file manager"
HOMEPAGE="http://futuramerlin.com/"
KEYWORDS=""
EGIT_REPO_URI="https://github.com/ethus3h/wreathe-file-manager.git"

#DEPEND="!<kde-apps/dolphin-9999"
RDEPEND="${DEPEND}"
