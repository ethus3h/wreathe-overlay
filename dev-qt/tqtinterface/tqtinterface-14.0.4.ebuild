# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="5"
TRINITY_MODULE_TYPE="dependencies"
TRINITY_MODULE_NAME="${PN}"

inherit trinity-base

DESCRIPTION="Interface and abstraction library for Qt and Trinity"
HOMEPAGE="http://trinitydesktop.org/"

LICENSE="GPL-2"
KEYWORDS="~amd64"
IUSE="-qt3 +tqt"
REQUIRED_USE="^^ ( qt3 tqt )"
SLOT="0"

DEPEND="qt3? ( dev-qt/qt:3 )
	tqt? ( dev-qt/tqt )
	!!x11-libs/tqtinterface"
RDEPEND="${DEPEND}"

S="${WORKDIR}/dependencies/${PN}"

pkg_setup() {
	use qt3 && export QTDIR="/usr/qt/3"
	use tqt && export QTDIR="/usr/tqt3"
}

src_configure() {
	mycmakeargs=(
	    -DUSE_QT3=ON
		-DQT_PREFIX_DIR="$QTDIR"
	 )

	 cmake-utils_src_configure
}
