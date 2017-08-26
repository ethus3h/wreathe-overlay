# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

mozApps=(fx)
mozId=616433

inherit moz-ext

DESCRIPTION="Mozilla extension: In the DOM Inspector, quickly navigate to elements"
HOMEPAGE="https://addons.mozilla.org/en-GB/firefox/addon/element-inspector/"

KEYWORDS="~amd64 ~x86"
LICENSE="MPL-1.1"
DEPEND="x11-plugins/moz-ext-dom-inspector-plus-dm"
