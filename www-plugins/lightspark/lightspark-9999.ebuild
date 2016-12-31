# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="6"
inherit cmake-utils nsplugins multilib toolchain-funcs git-r3

DESCRIPTION="High performance flash player"
HOMEPAGE="https://github.com/lightspark/lightspark"
EGIT_REPO_URI="git://github.com/lightspark/lightspark.git"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="curl ffmpeg gles nsplugin profile pulseaudio rtmp sdl"

RDEPEND=">=dev-cpp/libxmlpp-2.33.1:2.6
	>=dev-libs/boost-1.42
	dev-libs/libpcre[cxx]
	dev-cpp/glibmm
	dev-util/desktop-file-utils
	media-fonts/liberation-fonts
	media-libs/libpng:=
	media-libs/libsdl
	x11-libs/cairo
	x11-libs/gtk+:2
	x11-libs/libX11
	x11-libs/pango
	media-libs/sdl2-mixer
	curl? (
		net-misc/curl
	)
	ffmpeg? (
		virtual/ffmpeg
	)
	!gles? (
		>=media-libs/glew-1.5.3:=
		virtual/opengl
	)
	gles? (
		media-libs/mesa[gles2]
	)
	pulseaudio? (
		media-sound/pulseaudio
	)
	rtmp? (
		media-video/rtmpdump
	)
	virtual/jpeg:=
	www-plugins/gnash[gtk]"
DEPEND="${RDEPEND}
	>=sys-devel/gcc-4.6.0:=[cxx]
	sys-devel/llvm
	virtual/pkgconfig
	amd64? ( dev-lang/nasm )
	x86? ( dev-lang/nasm )"

pkg_pretend() {
	if [[ ${MERGE_TYPE} != binary ]]; then
		if [[ $(gcc-major-version) == 4 && $(gcc-minor-version) -lt 6 || $(gcc-major-version) -lt 4 ]] ; then
			eerror "You need at least sys-devel/gcc-4.6.0"
			die "You need at least sys-devel/gcc-4.6.0"
		fi
	fi
}

src_configure() {
	#Audio backends CMake variable doesn't seem to exist now
	#local audiobackends
	#use pulseaudio && audiobackends+="pulse"
	#use sdl && audiobackends+="sdl"
	#-DAUDIO_BACKEND="${audiobackends}"

	local mycmakeargs=(
		-DENABLE_CURL="$(usex curl)"
		-DENABLE_GLES2="$(usex gles)"
		-DENABLE_LIBAVCODEC="$(usex ffmpeg)"
		-DCOMPILE_PLUGIN="$(usex nsplugin)"
		-DENABLE_MEMORY_USAGE_PROFILING="$(usex profile)"
		-DENABLE_PROFILING="$(usex profile)"
		-DENABLE_RTMP="$(usex rtmp)"
		-DPLUGIN_DIRECTORY="${EPREFIX}"/usr/$(get_libdir)/${PN}/plugins
		-DCMAKE_BUILD_TYPE=Release
	)

	cmake-utils_src_configure
}

src_install() {
	cmake-utils_src_install

	use nsplugin && inst_plugin /usr/$(get_libdir)/${PN}/plugins/liblightsparkplugin.so

	# default to sdl audio if pulseaudio plugin is not built, bug #406197
	if use sdl && ! use pulseaudio; then
		sed -i 's/backend = pulseaudio/backend = sdl/' "${ED}/etc/xdg/${PN}.conf" || die
	fi
}

pkg_postinst() {
	if use nsplugin && ! has_version www-plugins/gnash; then
		elog "Lightspark now supports gnash fallback for its browser plugin."
		elog "Install www-plugins/gnash to take advantage of it."
	fi
	if use nsplugin && has_version www-plugins/gnash[nsplugin]; then
		elog "Having two plugins installed for the same MIME type may confuse"
		elog "Mozilla based browsers. It is recommended to disable the nsplugin"
		elog "USE flag for either gnash or lightspark. For details, see"
		elog "https://bugzilla.mozilla.org/show_bug.cgi?id=581848"
	fi
}
