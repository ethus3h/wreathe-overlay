# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

myCommit="335dbece103e2cbf6c7cf819ab6672c2956b17b3"

inherit qmake-utils

DESCRIPTION="Additional style plugins for Qt5 (gtk2, cleanlook, plastic, motif)"
HOMEPAGE="https://code.qt.io/cgit/qt/qtstyleplugins.git/"
SRC_URI="https://github.com/qt/${PN}/archive/${myCommit}.zip -> ${P}-${myCommit}.zip"

LICENSE="LGPL-2"
SLOT="5"
KEYWORDS="~amd64 ~x86"

DEPEND="
	x11-libs/gtk+:2
	dev-qt/qtgui:5=
	dev-qt/qtdbus:5=
	x11-libs/libX11"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${PN}-${myCommit}"

src_configure() {
	eqmake5
}

src_install() {
	emake INSTALL_ROOT="${D}" install
}

pkg_postinst() {
	elog ""
	elog "To make Qt5 applications use the gtk2 style"
	elog "insert the following into ~/.profile:"
	elog "QT_QPA_PLATFORMTHEME=gtk2"
	elog "For environments using ~/.pam_environment (gnome wayland):"
	elog "QT_QPA_PLATFORMTHEME OVERRIDE=gtk2"
	elog ""
}
