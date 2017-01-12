# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

WANT_AUTOMAKE="1.11"

inherit eutils flag-o-matic linux-info mono-env multilib nsplugins pax-utils versionator

DESCRIPTION="Moonlight is an open source implementation of Silverlight"
HOMEPAGE="http://www.go-mono.com/moonlight/"

LIBGDIPLUS="2.8.1"
GTKSHARP="gtk-sharp-2.12.10"
monoRevision="f41f7105c3702ba516aec356638ee40094bd8d1d"
monoBasicRevision="4ef1fbee25a8f584442f7f4d2422670b92c6e84d"
mesaRevision="3ed0a099c70e9d771e60e0ddf70bc0b5ba83a483"

LICENSE="BSD-4 GPL-2 GPL-2-with-linking-exception IDPL LGPL-2 LGPL-2.1 MIT Ms-PL NPL-1.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="alsa +curl +debug pax_kernel +nsplugin pulseaudio sdk test xen"

SRC_URI="https://github.com/ethus3h/moon-1/archive/v${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/mono/mono/archive/$monoRevision.zip -> mono-git-$monoRevision.zip
	https://github.com/mono/mono-basic/archive/$monoBasicRevision.zip -> mono-basic-git-$monoBasicRevision.zip
	https://github.com/mesa3d/mesa/archive/$mesaRevision.zip -> mesa-git-$mesaRevision.zip
	https://github.com/mono/libgdiplus/archive/$LIBGDIPLUS.tar.gz -> libgdiplus-$LIBGDIPLUS.tar.gz
	http://web.archive.org/web/20111225065517/http://ftp.novell.com/pub/mono/sources/gtk-sharp212/${GTKSHARP}.tar.bz2"

RDEPEND="
	alsa? ( >=media-libs/alsa-lib-1.0.18 )
	curl? ( net-misc/curl )
	pulseaudio? ( >=media-sound/pulseaudio-0.9.14 )
	>=dev-dotnet/gtk-sharp-2.12.9:2
	dev-dotnet/rsvg-sharp
	dev-dotnet/wnck-sharp
	>=dev-lang/mono-2.8
	>=dev-libs/boehm-gc-7.1
	>=dev-libs/glib-2.18
	>=media-libs/fontconfig-2.6.0
	>=media-libs/freetype-2.3.7
	>=media-video/ffmpeg-0.6
	>=net-libs/xulrunner-1.9.1:=
	>=x11-libs/cairo-1.8.4
	>=x11-libs/gtk+-2.14:2
	x11-libs/libXrandr
	=dev-dotnet/libgdiplus-2*
	"

DEPEND="${RDEPEND}
	virtual/pkgconfig
	dev-libs/expat
	"

pkg_setup() {
	if use kernel_linux; then
		get_version
		if linux_config_exists; then
			if linux_chkconfig_present SYSVIPC; then
				einfo "CONFIG_SYSVIPC is set, looking good."
			else
				eerror "If CONFIG_SYSVIPC is not set in your kernel .config, mono compilation will hang."
				eerror "See http://bugs.gentoo.org/261869 for more info."
				die "Please set CONFIG_SYSVIPC in your kernel .config"
			fi
		else
			ewarn "Was unable to determine your kernel .config"
			ewarn "Please note that if CONFIG_SYSVIPC is not set in your kernel .config, mono compilation will hang."
			ewarn "See http://bugs.gentoo.org/261869 for more info."
		fi
	fi
}

src_unpack() {
	unpack ${A}
	mv "${WORKDIR}/moon-1-${PV}" "${WORKDIR}/moon"
	rm -rf "${WORKDIR}/moon/mono"
	mv "${WORKDIR}/mono-$monoRevision" "${WORKDIR}/mono"
	rm -rf "${WORKDIR}/moon/mono-basic"
	mv "${WORKDIR}/mono-basic-$monoBasicRevision" "${WORKDIR}/mono-basic"
	rm -rf "${WORKDIR}/moon/mesa"
	mv "${WORKDIR}/mesa-$mesaRevision" "${WORKDIR}/mesa"
	mv "${WORKDIR}/libgdiplus-${LIBGDIPLUS}" "${WORKDIR}/libgdiplus"
	mv "${WORKDIR}/gtk-sharp-${GTKSHARP}" "${WORKDIR}/gtk-sharp"
}

S="${WORKDIR}/moon"

src_prepare() {
	eapply_user
	perl -pi -e "s/\\\$\\(shell cd \\\$\\(MONO_PATH\\) && git log \\| head -1 \\| awk '{print \\\$2}' \\)/$monoRevision/g" Makefile.am
	# we need to sed in the paxctl -m in the runtime/mono-wrapper.in so it don't
	# get killed in the build proces when MPROTEC is enable. #286280
	if use pax_kernel ; then
		ewarn "We are disabling MPROTECT on the mono binary."
		sed '/exec/ i\paxctl -m "$r/@mono_runtime@"' -i mono/runtime/mono-wrapper.in
		sed '/exec/ i\paxctl -m "$r/@mono_runtime@"' -i "${WORKDIR}/mono-$monoBootstrapVersion/runtime/mono-wrapper.in"
	fi
}

src_configure() {
	strip-flags
	append-flags -fno-strict-aliasing
	echo && einfo "Building moonlight" && echo
	./autogen.sh	--prefix=/usr \
			--enable-shared \
			--with-cairo=system \
			--with-ffmpeg=yes \
			--with-glx=yes \
			--with-ff3=yes \
			--without-ff2 \
			--enable-desktop-support \
			--with-examples=no \
			--with-curl=$(use !curl && printf "no" || printf "system") \
			--with-alsa=$(use !alsa && printf "no" || printf "yes") \
			--with-pulseaudio=$(use !pulseaudio && printf "no" || printf "yes") \
			--with-debug=$(use !debug && printf "no" || printf "yes") \
			--with-testing=$(use !test && printf "no" || printf "yes") \
			--with-performance=$(use !test && printf "no" || printf "yes") \
			$(use_enable nsplugin browser-support) \
			$(use_enable sdk) \
				|| die "Configure failed for moonlight"
}

src_compile() {
	emake || die "emake moonlight failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
	if use nsplugin; then
		inst_plugin /usr/$(get_libdir)/moonlight/plugin/libmoonloader.so || die "installing libmoonloader failed"
	fi
	find "${D}" -name '*.la' -exec rm -rf '{}' '+' || die "la removal failed"
}
