# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Ember Web site"
HOMEPAGE="https://futuramerlin.com/"
SRC_URI="https://github.com/ethus3h/ember-web-site/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
IUSE="local-install"
KEYWORDS="~amd64"
RDEPEND="app-misc/futuramerlin-web-toolkit
	app-misc/ember-information-technology-environment"
DEPEND="${RDEPEND}"

src_compile() {
	rm -r information-technology/env || die
	mkdir information-technology/env || die
	cp -r /usr/share/eite/web/ information-technology/env || die
	futuramerlin-web-toolkit-build || die
}

src_install() {
	mv futuramerlin-web-toolkit-output ember-web-site || die
	insinto /usr/share/doc/
	doins -r ember-web-site
	insinto /
	if use local-install; then
		doins ember-web-site/m.css
		doins -r ember-web-site/f
	fi
}
