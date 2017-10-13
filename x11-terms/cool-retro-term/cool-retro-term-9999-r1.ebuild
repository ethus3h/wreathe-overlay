# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit git-r3 qmake-utils eutils

SLOT="0"

QT5_MODULE="qtbase"

DESCRIPTION="A good-looking terminal emulator which mimics the old cathode ray tube display."

HOMEPAGE="https://github.com/Swordfish90/cool-retro-term"

EGIT_REPO_URI="${HOMEPAGE}.git"
EGIT_CHECKOUT_DIR="${S}/src/"

LICENSE="GPL-2"

KEYWORDS=""

DEPEND="
>=dev-qt/qtcore-5.3.1
>=dev-qt/qtquickcontrols-5.3.1[widgets]
>=dev-qt/qtdeclarative-5.3.1[localstorage]
>=dev-qt/qtgraphicaleffects-5.3.1
"
src_unpack() {
	git-r3_fetch || die "Failed to fetch"
	git-r3_checkout || die "Failed to check out"
}

src_configure() {
	cd "${EGIT_CHECKOUT_DIR}"
	einfo "Preparing targets..."
	eqmake5 || die "Failed to configure"
}

src_compile() {
	cd "${EGIT_CHECKOUT_DIR}"
	einfo "Commencing compilation..."
	emake || die "Failed to compile"
}

src_install() {
	into /usr/
		dobin ${EGIT_CHECKOUT_DIR}/${PN} || die "Failed to install application binary"
	insinto /usr/lib/qt5/qml/
		doins -r ${EGIT_CHECKOUT_DIR}/qmltermwidget/QMLTermWidget || die "Failed to install QML imports"
	for size in 32 64 128 256; do
		doicon --size ${size} ${EGIT_CHECKOUT_DIR}/app/icons/${size}x${size}/${PN}.png
	done
	domenu ${EGIT_CHECKOUT_DIR}/cool-retro-term.desktop
	dodoc ${EGIT_CHECKOUT_DIR}/README.md || die "Failed to install README"
}

pkg_postinst() {
	eqawarn "Please report any code-related issues upstream!"
	elog "This package lacks a man page for now. Please invoke \"${PN} -h\" if You need help!"
	elog "Additional information can be obtained via \"bzcat /usr/share/doc/${PN}-${PV}/README.md.bz2\""
	elog "Icons are located under \"/usr/share/icons/${PN}/\"."
}
