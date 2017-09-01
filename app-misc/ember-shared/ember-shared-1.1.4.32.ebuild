# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Code shared between various Ember software"
HOMEPAGE="https://futuramerlin.com/"
SRC_URI="https://github.com/ethus3h/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

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
