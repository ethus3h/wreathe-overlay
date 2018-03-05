# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION=" Fast and powerful CSV (delimited text) parser that gracefully handles large files and malformed input"
HOMEPAGE="https://www.papaparse.com/"
SRC_URI="https://github.com/mholt/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

src_install() {
	insinto "/usr/share/javascript/${PN}/"
	rm papaparse.min.js bower.json Gruntfile.js
	doins -r *
}
