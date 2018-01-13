# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

mozApps=(fx)
mozId=651531

inherit moz-ext

DESCRIPTION="Mozilla extension: Some tweaks for Tab Scope extension"
HOMEPAGE="https://github.com/Infocatcher/Tab_Scope_Tweaker/issues"

KEYWORDS="~amd64 ~x86"
LICENSE="MPL-1.1"
DEPEND="x11-plugins/moz-ext-tab-scope"
