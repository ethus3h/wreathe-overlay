# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

DESCRIPTION="IBM 026 Keypunch Emulator for the X Window System"
HOMEPAGE="http://x3270.bgp.nu/x026.html"
SRC_URI="mirror://sourceforge/x3270/${P}.tgz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 ~x86"

RDEPEND=""
DEPEND="${RDEPEND}
	x11-misc/imake"

src_configure() {
	xmkmf
}
