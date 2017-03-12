# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

KDE_AUTODEPS="false"
inherit kde5 git-r3

DESCRIPTION="Wreathe character selection utility"
HOMEPAGE="http://futuramerlin.com/"
KEYWORDS=""
IUSE=""
EGIT_REPO_URI="git://github.com/ethus3h/wreathe-charselect.git"

DEPEND="kde-apps/kcharselect"
RDEPEND="${DEPEND}"
