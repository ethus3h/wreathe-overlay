# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

DESCRIPTION="IBM 3270 terminal emulator for the X Window System (metapackage)"
HOMEPAGE="http://x3270.bgp.nu/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE="ssl"

RDEPEND="net-misc/suite3270"
DEPEND="${RDEPEND}"
