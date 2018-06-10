# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

MY_P="${P/qt/qt-1}"

inherit cmake-utils multibuild

DESCRIPTION="PolicyKit Qt API wrapper library"
HOMEPAGE="https://www.kde.org/"
SRC_URI="https://dev.gentoo.org/~kensington/distfiles/${MY_P}.tar.xz"

LICENSE="LGPL-2"
SLOT="4"
KEYWORDS="amd64 ~arm ~arm64 ppc ppc64 x86 ~x86-fbsd"
IUSE="debug examples qt4"

RDEPEND="
	dev-libs/glib:2
	sys-auth/polkit-qt:0
	>=sys-auth/polkit-0.103
	qt4? (
		dev-qt/qtcore:4[glib]
		dev-qt/qtdbus:4
		dev-qt/qtgui:4[glib]
	)
"
DEPEND="${RDEPEND}"

DOCS=( AUTHORS README README.porting TODO )

S=${WORKDIR}/${MY_P}

pkg_setup() {
	MULTIBUILD_VARIANTS=( $(usev qt4) )
}

src_configure() {
	myconfigure() {
		local mycmakeargs=(
			-DSYSCONF_INSTALL_DIR="${EPREFIX}"/etc
			-DBUILD_EXAMPLES=$(usex examples)
		)

		if [[ ${MULTIBUILD_VARIANT} = qt4 ]] ; then
			mycmakeargs+=( -DUSE_QT4=ON )
		fi

		cmake-utils_src_configure
	}

	multibuild_foreach_variant myconfigure
}

src_compile() {
	multibuild_foreach_variant cmake-utils_src_compile
}

src_test() {
	multibuild_foreach_variant cmake-utils_src_test
}

src_install() {
	multibuild_foreach_variant cmake-utils_src_install
	rm "${D}"/usr/share/dbus-1/system-services/org.qt.policykit.examples.service || die
	rm "${D}"/usr/share/polkit-1/actions/org.qt.policykit.examples.policy || die
}
