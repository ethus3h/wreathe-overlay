# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3

DESCRIPTION="The Ember Information Technology Environment"
HOMEPAGE="https://futuramerlin.com/"
EGIT_REPO_URI="https://github.com/ethus3h/ember-information-technology-environment.git"

LICENSE="AGPL-3"
SLOT="0"
IUSE="doc"
KEYWORDS=""
RDEPEND="app-misc/wreathe-meta
	dev-javascript/PapaParse
	virtual/perl6"
DEPEND="${RDEPEND}
	doc? ( app-misc/futuramerlin-web-toolkit )"
