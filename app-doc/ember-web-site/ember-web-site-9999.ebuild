# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

inherit git-r3

DESCRIPTION="Ember Web site"
HOMEPAGE="https://futuramerlin.com/"
EGIT_REPO_URI="git://github.com/ethus3h/ember-web-site.git"

LICENSE="GPL-2"
SLOT="0"
IUSE="local-install"
KEYWORDS=""
RDEPEND=""
DEPEND="${RDEPEND}
	app-misc/futuramerlin-web-toolkit"

src_configure() {
	#Disable installation of /m.css
	ewarn "Trying to disable local installation"
	perl -pi -e 's/enableLocalInstallation/disableLocalInstallation/g' .futuramerlin-web-toolkit/.futuramerlin-web-toolkit.cfg || die
	ewarn "$(sed '3q;d' .futuramerlin-web-toolkit/.futuramerlin-web-toolkit.cfg)"
}

src_compile() {
	futuramerlin-web-toolkit-build
}

src_install() {
	mv futuramerlin-web-toolkit-output ember-web-site
	insinto /usr/doc/
	doins -r ember-web-site
	insinto /
	if use local-install; then
		doins ember-web-site/m.css
		doins -r ember-web-site/f
	fi
}
