# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

mozApps=(fx)
myCommit="f29a9ab87b8c75324b8955727152833f9c28f99c"

inherit moz-ext

DESCRIPTION="Mozilla extension: a Flash VM and runtime written in JavaScript"
HOMEPAGE="https://github.com/mozilla/shumway"

SRC_URI="https://github.com/mozilla/${addonName}/raw/${myCommit}/extension/firefox/${addonName}.xpi -> ${P}.zip"

KEYWORDS="~amd64 ~x86"
LICENSE="Apache-2.0"
