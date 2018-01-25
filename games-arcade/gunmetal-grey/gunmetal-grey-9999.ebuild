# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3

DESCRIPTION="Platformer computer game"
HOMEPAGE="https://futuramerlin.com/"

EGIT_REPO_URI="https://github.com/ethus3h/gunmetal-grey.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""

RDEPEND="dev-python/pygame
	dev-games/tiled"
DEPEND="${RDEPEND}"

src_install() {
	insinto /usr/local/games/gunmetal-grey/
	GLOBIGNORE="README.md:.git:.egup.tags"
	doins -r *
	unset GLOBIGNORE
}
