# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

mozApps=(sm tb fx)
mozId=318146

inherit moz-ext

DESCRIPTION="Mozilla extension: Adds UI for invoking the DOM Inspector"
HOMEPAGE="http://www.projectit.com/"

KEYWORDS="~amd64 ~x86"
LICENSE="MPL-1.1"
DEPEND="x11-plugins/moz-ext-dom-inspector-plus-dm"
