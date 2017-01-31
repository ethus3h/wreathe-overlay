# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit webapp

localName="Snap--Build-Your-Own-Blocks"
DESCRIPTION="A visual programming language inspired by Scratch"
HOMEPAGE="http://snap.berkeley.edu/"
SRC_URI="https://github.com/jmoenig/${localName}/archive/${PV}.tar.gz"

LICENSE="AGPL-3+"
KEYWORDS="~amd64 ~x86"

RDEPEND="virtual/httpd-basic"
DEPEND="${RDEPEND}"

S="${WORKDIR}/${localName}-${PV}"

src_install() {
	insinto /usr/share/webapps/snap
	doins -r *
}
