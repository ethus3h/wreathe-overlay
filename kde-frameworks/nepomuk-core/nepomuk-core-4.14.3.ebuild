# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
inherit kde4-base

DESCRIPTION="Nepomuk core libraries"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="debug epub exif migrator ffmpeg pdf taglib"

DEPEND="
	>=dev-libs/shared-desktop-ontologies-0.11.0
	>=dev-libs/soprano-2.9.3[dbus,raptor,redland,virtuoso]
	kde-apps/kdegraphics-mobipocket:4.14
	epub? ( app-text/ebook-tools )
	exif? ( media-gfx/exiv2:= )
	ffmpeg? ( virtual/ffmpeg )
	kde-frameworks/baloo
	pdf? ( app-text/poppler[qt4] )
	taglib? ( media-libs/taglib )
"
RDEPEND="${DEPEND}
	!<kde-base/nepomuk-4.8.80:4
"

RESTRICT="test"
# bug 392989

src_prepare() {
	# KDE5 QMobipocket doesn't work with this (seems to cause nepomuk to
	# be built using the Qt5 moc for some weird reason), so depend on an old
	# version in a custom path and patch the CMakeLists.txt accordingly
	epatch "${FILESDIR}"/'use-kde4-qmobipocket.diff' || die
	default
}

src_configure() {
	set -x
	local mycmakeargs=(
		$(cmake-utils_use_find_package epub EPub)
		$(cmake-utils_use_find_package exif Exiv2)
		$(cmake-utils_use_find_package ffmpeg FFmpeg)
		$(cmake-utils_use_find_package migrator Baloo)
		$(cmake-utils_use_find_package pdf PopplerQt4)
		$(cmake-utils_use_find_package taglib Taglib)
	)
	
	kde4-base_src_configure
}
