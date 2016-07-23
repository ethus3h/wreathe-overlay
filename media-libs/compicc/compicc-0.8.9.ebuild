# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6

DESCRIPTION="CompICC"
HOMEPAGE="http://www.oyranos.org/compicc/"
SRC_URI="http://tenet.dl.sourceforge.net/project/compicc/Compicc/compicc-0.8.9.tar.bz2"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86"

RDEPEND=">=media-libs/oyranos-0.9.0
	|| ( >=x11-wm/compiz-0.8 >=x11-wm/compiz-reloaded-0.8 >=compiz-reloaded/compiz-0.8.0 )
	x11-proto/xextproto
	x11-libs/libXxf86vm
	dev-util/pkgconfig
	x11-libs/libXrandr
	x11-libs/libXinerama
	app-doc/doxygen
	dev-libs/libxml2
	x11-libs/libXfixes"
DEPEND="${RDEPEND}"

