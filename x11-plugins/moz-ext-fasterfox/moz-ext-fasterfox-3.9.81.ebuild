# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

mozApps=(fx)
# There are newer versions, but the licensing is screwed up on them, and they don't appear to be critical updates anyway.
mozId=157259

inherit moz-ext

DESCRIPTION="Mozilla extension: Gives performance & network tweaks for Firefox"
HOMEPAGE="https://addons.mozilla.org/en-GB/firefox/addon/rsccmanfasterfox/"

KEYWORDS="~amd64 ~x86"
LICENSE="MPL-1.1 GPL-2 LGPL-2.1 GPL-3"
