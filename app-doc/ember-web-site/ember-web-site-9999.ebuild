# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="6"

inherit git-r3

DESCRIPTION="Ember Web site"
HOMEPAGE="https://futuramerlin.com/"
EGIT_REPO_URI="git://github.com/ethus3h/ember-web-site.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
RDEPEND=""
DEPEND="${RDEPEND}
	app-misc/futuramerlin-web-toolkit
	dev-vcs/git"

src_configure() {
	#Disable installation of /m.css
	perl -pi -e 's/enableLocalInstallation/disableLocalInstallation/g' .futuramerlin-web-toolkit/.futuramerlin-web-toolkit.cfg
}

src_compile() {
	futuramerlin-web-toolkit-build
}

src_install() {
	mv futuramerlin-web-toolkit-output ember-web-site
	insinto /usr/doc/
	doins -r ember-web-site
}
