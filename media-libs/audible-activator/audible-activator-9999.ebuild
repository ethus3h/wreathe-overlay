# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="6"

inherit git-r3

DESCRIPTION="Retrieves your activation data (activation_bytes) from Audible servers"
HOMEPAGE="https://github.com/inAudible-NG/audible-activator"
EGIT_REPO_URI="git://github.com/inAudible-NG/audible-activator.git"

LICENSE="GPL3"
SLOT="0"
KEYWORDS="~amd64 -*"
RDEPEND="dev-lang/python:2.7
    dev-python/selenium
    dev-python/requests
    www-client/chromium
    www-apps/chromedriver"
DEPEND="${RDEPEND}"
