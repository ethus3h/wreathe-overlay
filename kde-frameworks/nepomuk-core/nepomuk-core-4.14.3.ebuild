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
	<kde-apps/kdegraphics-mobipocket-16.12
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
	epatch "${FILESDIR}"/'4.14...ethus3h_2018may17a18n2-make.diff' || die
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

	adddeny /usr/lib64/qt5/bin/moc
	# It picks Qt5 moc for some weird reason
	find . -type f -exec grep -C3 'moc' {} \;
	#find . -type f -exec perl -0777 -p -i -e 's/qt5\/bin\/moc/qt4\/bin\/moc/g' {} \; || die
	find . -type f -exec grep -C3 'qt5\/bin\/moc' {} \;
	env
	#die
}
