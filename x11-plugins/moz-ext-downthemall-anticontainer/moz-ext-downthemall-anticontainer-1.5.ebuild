# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

mozApps=(sm fx)
mozId=424871

inherit moz-ext

DESCRIPTION="Mozilla extension: DownThemAll container page resources"
HOMEPAGE="https://github.com/downthemall/anticontainer"

KEYWORDS="~amd64 ~x86"
LICENSE="GPL-2"

DEPEND="x11-plugins/moz-ext-downthemall"
