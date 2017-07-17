# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

CMAKE_MIN_VERSION="3.2.0"

inherit cmake-utils eutils

DESCRIPTION="Simple set of classes for developing HTTP server applications in Qt"
HOMEPAGE="https://github.com/nitroshare/qhttpengine"
if [[ ${PV} == *9999* ]];then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/nitroshare/${PN}"
	KEYWORDS=""
else
  SRC_URI="https://github.com/nitroshare/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~x86 ~amd64"
fi

LICENSE="MIT"
SLOT="0"
IUSE="doc examples test"

DEPEND="
	>=dev-qt/qtcore-5.4:5
	>=dev-qt/qtnetwork-5.4:5
	doc? ( app-doc/doxygen )"

RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use doc BUILD_DOC)
		$(cmake-utils_use examples BUILD_EXAMPLES)
		$(cmake-utils_use test BUILD_TESTS)
	)
}

src_install() {
	default
	if use doc; then
		insinto /usr/share/doc/${PF}
		dohtml -r doc/doxygen/html/*
	fi
}
