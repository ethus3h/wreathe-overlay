# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="6"

inherit git-r3

DESCRIPTION="Retrieves your activation data (activation_bytes) from Audible servers"
HOMEPAGE="https://github.com/inAudible-NG/audible-activator"
EGIT_REPO_URI="git://github.com/inAudible-NG/audible-activator.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 -*"
#www-client/chromium provides chromedriver
RDEPEND="dev-lang/python:2.7
    dev-python/selenium
    dev-python/requests
    www-client/chromium"
DEPEND="${RDEPEND}"

src_install() {
    insinto /usr/local/share/audible-activator/
    GLOBIGNORE="README.md:LICENSE:.git:.gitignore:audible-activator.py"
    doins -r *
    unset GLOBIGNORE
    exeinto /usr/local/share/audible-activator/
    doexe audible-activator.py
    dosym /usr/local/share/audible-activator/audible-activator.py /usr/local/bin/audible-activator.py
    dosym /usr/local/share/audible-activator/chromedriver "$(which chromedriver)"
}
