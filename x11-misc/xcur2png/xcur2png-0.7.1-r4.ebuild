# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Ebuild based on https://git.archlinux.org/svntogit/community.git/plain/trunk/PKGBUILD?h=packages/xcur2png

EAPI=6

DESCRIPTION="Converts X11 cursors to PNG images+metadata"
HOMEPAGE="http://cli-apps.org/content/show.php/xcur2png?content=86010"
SRC_URI="https://web.archive.org/web/20150930132437/http://cli-apps.org/CONTENT/content-files/86010-${PN}-${PV}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="media-libs/libpng:=
	x11-libs/libXcursor"
DEPEND="${RDEPEND}"
