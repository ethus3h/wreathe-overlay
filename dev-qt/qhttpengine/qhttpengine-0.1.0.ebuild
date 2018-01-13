# Copyright 1999-2018 Gentoo Foundation
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

RDEPEND="
	>=dev-qt/qtcore-5.4:5
	>=dev-qt/qtnetwork-5.4:5"

DEPEND="${RDEPEND}
	doc? ( app-doc/doxygen )"

src_configure() {
	local mycmakeargs=(
		-DBUILD_DOC="$(usex doc)"
		-DBUILD_EXAMPLES="$(usex examples)"
		-DBUILD_TESTS="$(usex test)"
	)
	cmake-utils_src_configure
}

src_install() {
	default
}
