# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="NEPOMUK metapackage"
HOMEPAGE="http://nepomuk.semanticdesktop.org/"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64 -*"
RDEPEND=">=dev-libs/shared-desktop-ontologies-0.2
	>=dev-libs/soprano-2.9.0[dbus,raptor,redland]
	kde-frameworks/nepomuk-core
	kde-frameworks/nepomuk-widgets"
DEPEND="${RDEPEND}"
