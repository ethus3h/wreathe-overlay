# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit webapp

DESCRIPTION="A visual programming language inspired by Scratch"
HOMEPAGE="http://snap.berkeley.edu/"
SRC_URI="https://github.com/jmoenig/Snap--Build-Your-Own-Blocks/archive/${PV}.tar.gz"

LICENSE="AGPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="virtual/httpd-basic"
DEPEND="${RDEPEND}"

src_install() {
	insinto /usr/share/webapps/snap
	doins -r *
}
