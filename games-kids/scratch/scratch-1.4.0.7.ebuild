# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=3

inherit games confutils

DESCRIPTION="Programming environment for creative/artistic work"
HOMEPAGE="http://scratch.mit.edu/"
SRC_URI="http://download.scratch.mit.edu/${P}.src.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="alsa oss pulseaudio v4l"

DEPEND="
	>=x11-libs/cairo-1.8.6
	>=x11-libs/pango-1.20.5
	>=dev-libs/glib-2.20.1:2
	v4l? ( >=media-libs/libv4l-0.5.8 )
"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${P}.src"
ABI="x86"

pkg_setup() {
	# Is the a convenience function for "zero or one"?
	confutils_require_one alsa oss pulseaudio

	games_pkg_setup
}

src_prepare() {
	if ! use v4l; then
		sed -i '/\/camera/d' "${S}/Makefile"
	fi
	use alsa	   || rm -f Plugins/vm-sound-ALSA
	use oss		|| rm -f Plugins/vm-sound-OSS
	use pulseaudio || rm -f Plugins/vm-sound-pulse
}

src_install() {
	local libdir="$(games_get_libdir)/${PN}"
	local datadir="/usr/share/${PN}"
	local icondir="/usr/share/icons/hicolor"
	dodir "${libdir}" "${datadir}"
	cp -r Scratch.* Plugins "${D}${libdir}"
	cp -r Help locale Media Projects "${D}${datadir}"
	doman src/man/*
	dodoc ACKNOWLEDGEMENTS KNOWN-BUGS README
	exeinto /usr/bin
	doexe src/scratch
	insinto /usr/share/mime/packages
	doins src/scratch.xml
	(
		cd src/icons
		for res in *; do
			insinto "${icondir}/${res}/apps"
			doins "${res}"/scratch*.png
			if [ "${res}" != "32x32" ]; then
				insinto "${icondir}/${res}/mimetypes"
				newins "${res}/gnome-mime-application-x-scratch-project.png" mime-application-x-scratch-project.png
			fi
		done
	)
	install_runner
	make_desktop_entry scratch Scratch scratch "Education;Development" "MimeType=application/x-scratch-project"
}

install_runner() {
	if   use alsa;	   then squeak_sound_plugin="ALSA"
	elif use oss;		then squeak_sound_plugin="OSS"
	elif use pulseaudio; then squeak_sound_plugin="pulse"
	else					  squeak_sound_plugin="null"
	fi

	local tmpexe=$(emktemp)
	cat << EOF > "${tmpexe}"
#!/bin/sh
cd
exec \
	"$(games_get_libdir)/${PN}/scratch_squeak_vm"	 \\
	-plugins "$(games_get_libdir)/${PN}/Plugins" \\
	-vm-sound-${squeak_sound_plugin}				  \\
	"$(games_get_libdir)/${PN}/Scratch.image"	\\
	"${@}"
EOF
	chmod go+rx "${tmpexe}"
	newbin "${tmpexe}" "${PN}" || die
}
