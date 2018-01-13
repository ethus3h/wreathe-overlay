# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Metapackage for libplatform"
HOMEPAGE="https://github.com/Pulse-Eight/platform"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~arm ~amd64 ~x86"

DEPEND="|| ( dev-libs/libplatform dev-libs/libp8-platform )"
RDEPEND="${DEPEND}"
