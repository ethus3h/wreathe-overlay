# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="5"

TRINITY_MODULE_TYPE="dependencies"
TRINITY_MODULE_NAME="${PN}"

inherit trinity-base

set-trinityver

DESCRIPTION="aRts, the Trinity sound (and all-around multimedia) server/output manager"
HOMEPAGE="http://trinitydesktop.org/"

LICENSE="GPL-2"
KEYWORDS="~amd64"
IUSE="alsa -artswrappersuid jack mp3 nas vorbis"
SLOT="$TRINITY_VER"

DEPEND="dev-qt/tqtinterface
	dev-libs/glib:2
	media-libs/audiofile
	mp3? ( media-libs/libmad )
	nas? ( media-libs/nas )
	alsa? ( media-libs/alsa-lib )
	vorbis? ( media-libs/libogg media-libs/libvorbis )
	jack? ( >=media-sound/jack-audio-connection-kit-0.90 )"
RDEPEND="${RDEPEND}"

S="${WORKDIR}/dependencies/${PN}"

src_configure() {
	mycmakeargs=(
		-DAUDIOFILE=ON
		$(cmake-utils_use_with mp3 MAD)
		$(cmake-utils_use_with nas NAS)
		$(cmake-utils_use_with alsa ALSA)
		$(cmake-utils_use_with vorbis VORBIS)
		$(cmake-utils_use_with jack JACK)
		# NOTE: WITH_ESD dropped due to remove of esound long ago
	)

	trinity-base_src_configure
}

src_install() {
	trinity-base_src_install

	# used for realtime priority, but off by default as it is a security hazard
	use artswrappersuid && chmod u+s "${D}/${PREFIX}/bin/artswrapper"
}

pkg_postinst() {
	if ! use artswrappersuid ; then
		elog "Run chmod u+s ${PREFIX}/bin/artswrapper to let artsd use realtime priority"
		elog "and so avoid possible skips in sound. However, on untrusted systems this"
		elog "creates the possibility of a DoS attack that'll use 100% cpu at realtime"
		elog "priority, and so is off by default. See bug #7883."
		elog "Or, you can set the local artswrappersuid USE flag to make the ebuild do this."
	fi
}
