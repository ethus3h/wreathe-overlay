# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

myCommit="99cd37a672fef82753817c3f48ac4146396791b7"

DESCRIPTION="CMap Resources"
HOMEPAGE="https://futuramerlin.com/"
SRC_URI="https://github.com/ethus3h/ember-shared/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
RDEPEND="dev-python/internetarchive"

src_install() {
	exeinto /usr/bin
	GLOBIGNORE="README.md:LICENSE.md:.codeclimate.yml:.git:.egup.tags"
	doexe *
	unset GLOBIGNORE
}
