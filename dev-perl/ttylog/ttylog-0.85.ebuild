# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

MODULE_AUTHOR=BBB
MODULE_VERSION="${PV}"
inherit perl-module

DESCRIPTION="ttylog - Log tty sessions"

SRC_URI="mirror://cpan/authors/id/B/BB/BBB/${P}.tar.gz"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND="
	dev-util/strace
"
