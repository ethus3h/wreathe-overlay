# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

myCommit="10674328e5f058ceff8fcad5398e9d2c489a647a"
DESCRIPTION="Visual Bell for X11"
HOMEPAGE="https://github.com/rianhunter/xvisbell"
SRC_URI="https://github.com/rianhunter/${PN}/archive/${myCommit}.zip -> ${P}-${myCommit}.zip
	https://github.com/ethus3h/xvisbell/commit/f856eb76420f550c3cda7b2e77f3fe07ac824c72.diff -> ${P}-0000-f856eb76420f550c3cda7b2e77f3fe07ac824c72.diff
	https://github.com/ethus3h/xvisbell/commit/e146f10b43667e5df9025cac53e8dc4b52161230.diff -> ${P}-0001-e146f10b43667e5df9025cac53e8dc4b52161230.diff
	https://github.com/ethus3h/xvisbell/commit/2235b6fcbfb7cdcdd914e731d2fcf8cb117e32de.diff -> ${P}-0002-2235b6fcbfb7cdcdd914e731d2fcf8cb117e32de.diff
	https://github.com/ethus3h/xvisbell/commit/4f8e1bf682a7d292f516bba121a82a654ec579b5.diff -> ${P}-0003-4f8e1bf682a7d292f516bba121a82a654ec579b5.diff
	https://github.com/ethus3h/xvisbell/commit/50d48bcf521e8a2b7509277cfcd044eae85666dc.diff -> ${P}-0004-50d48bcf521e8a2b7509277cfcd044eae85666dc.diff
	https://github.com/ethus3h/xvisbell/commit/f505ee7c168afb9907e40b232824a77b231d129a.diff -> ${P}-0005-f505ee7c168afb9907e40b232824a77b231d129a.diff"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="x11-libs/libX11
	x11-libs/libxkbcommon"
DEPEND="${RDEPEND}"
S="${WORKDIR}/${PN}-${myCommit}"

src_prepare() {
	default
	eapply "${DISTDIR}/${P}"-*.diff
}

src_install() {
	dobin xvisbell
}
