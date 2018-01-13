# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

mozApps=(fx)

inherit moz-ext

DESCRIPTION="Mozilla extension: Fix clicking a tab once and then moving mouse opens window"
HOMEPAGE="http://space.geocities.yahoo.co.jp/gl/alice0775"

SRC_URI="https://github.com/ethus3h/personal/raw/9b66cccc4f148ea0db640ab15417cf0ea6d43065/${addonName}-${PV}-fake-reconstructed-2017jul01a02-fx.xpi -> ${P}.zip"

KEYWORDS="~amd64 ~x86"
LICENSE="MPL-1.1"
