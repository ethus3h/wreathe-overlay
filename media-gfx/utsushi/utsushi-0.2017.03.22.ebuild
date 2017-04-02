# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit eutils multilib

myCommit="fc3b31ef2a8330df4abd0a2b863ec690d84aa692"
DESCRIPTION="SANE backend driver for newer Epson scanners (DS, ET, PX, etc)"
HOMEPAGE="https://github.com/utsushi/utsushi"
SRC_URI="https://github.com/utsushi/utsushi/archive/${myCommit}.zip -> ${P}-${myCommit}.zip"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="gtk imagemagick jpeg nls openmp tiff udev"
S="${WORKDIR}/${PN}-${myCommit}"

# These are needed by utsushi's 'bootstrap':
#   dev-libs/gnulib
#   sys-devel/autoconf-archive
#   sys-devel/autoconf-wrapper
#   sys-devel/automake-wrapper
#   sys-devel/gettext
#   sys-devel/libtool
#   sys-devel/patch
DEPEND="
	dev-libs/gnulib
	sys-devel/autoconf-archive
	sys-devel/autoconf-wrapper
	sys-devel/automake-wrapper
	sys-devel/gettext
	sys-devel/libtool
	sys-devel/patch
	media-gfx/sane-backends
	virtual/libusb:1
	gtk?          ( dev-cpp/gtkmm:2.4 )
	imagemagick?  ( media-gfx/imagemagick )
	jpeg?         ( virtual/jpeg:0 )
	tiff?         ( media-libs/tiff:0= )
	udev?         ( virtual/udev )
"

RDEPEND="
	${DEPEND}
"

src_prepare() {
	# Copy over new 'ltmain.sh' file (patch)
	cp "${FILESDIR}"/ltmain.sh-2.4.diff "${S}"/sane/

	# Ensure sane configuration is created if SANE confdir is set
	epatch "${FILESDIR}/${PN}-9999-sane-makefile-fix.patch"

	# utsushi requires using this bootstrap wrapper in lieu of autotools
	"${S}/bootstrap" || die

	# Create SANE configuration directory (used by sane/Makefile.am to create
	# utsushi backend config)
	dodir /etc/sane.d/dll.d
}

src_configure() {
	econf \
		--with-sane                                 \
		--with-sane-confdir="${EPREFIX}"/etc/sane.d \
		--without-included-boost                    \
		--with-boost=yes                            \
		$(use_with gtk gtkmm)                       \
		$(use_with imagemagick magick)              \
		$(use_with imagemagick magick-pp)           \
		$(use_with jpeg)                            \
		$(use_enable nls)                           \
		$(use_enable openmp)                        \
		$(use_with tiff)                            \
		$(use_enable udev udev_config)              \
		$(use_with udev udev_confdir "${EPREFIX}"/$(get_libdir)/udev)
}
