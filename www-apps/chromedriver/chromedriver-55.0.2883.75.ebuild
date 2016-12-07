# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="6"
PYTHON_COMPAT=( python2_7 )

inherit chromium-2

DESCRIPTION="Developed in collaboration with the Chromium team, ChromeDriver is a standalone server which implements WebDriver's wire protocol."
HOMEPAGE="https://sites.google.com/a/chromium.org/chromedriver/"
SRC_URI="https://commondatastorage.googleapis.com/chromium-browser-official/${P}.tar.xz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 -*"
RDEPEND="www-client/chromium"
DEPEND="${RDEPEND}"

src_install() {
    insinto /usr/local/share/audible-activator/
    GLOBIGNORE="README.md:LICENSE:.git:.gitignore:audible-activator.py"
    doins -r *
    unset GLOBIGNORE
    exeinto /usr/local/share/audible-activator/
    doexe audible-activator.py
    dosym /usr/bin/google-chrome "$(which chromium)"
}
