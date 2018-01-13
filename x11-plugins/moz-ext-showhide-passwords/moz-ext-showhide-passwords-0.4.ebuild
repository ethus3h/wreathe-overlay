# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

mozApps=(an fx)
mozId=599873
destDirName='shpassword@shpassword.fr'

inherit moz-ext

DESCRIPTION="Mozilla extension: Add a link near password fields to hide or show passwords."
HOMEPAGE="https://addons.mozilla.org/en-GB/firefox/addon/showhide-passwords/"

KEYWORDS="~amd64 ~x86"
LICENSE="MPL-2.0"
