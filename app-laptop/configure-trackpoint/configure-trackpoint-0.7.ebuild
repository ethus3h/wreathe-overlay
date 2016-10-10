# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit gnome2

DESCRIPTION="Thinkpad configuration utility for TrackPoint (For the linux
kernel 2.6 TrackPoint driver)"
HOMEPAGE="http://tpctl.sourceforge.net/configure-trackpoint.html"
SRC_URI="mirror://sourceforge/tpctl/${PN}/${PV}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="app-laptop/tp_smapi
	>=x11-libs/gtk+-2.2:2
	kde-apps/kdesu
	>=gnome-base/libgnomeui-2.4
	>=sys-devel/gettext-0.11"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

src_prepare() {
	sed -i -e "/^Exec/s:gksu:kdesu:" ${PN}.desktop || die "Failed to replace gksu with kdesu"
	sed -i -e "/^Icon/s:trackpoint\.png:trackpoint:" ${PN}.desktop || die "Failed to remove extension from icon name"
	gnome2_src_prepare
}

src_install() {
	gnome2_src_install
}

pkg_postinst() {
	gnome2_pkg_postinst
	ewarn "${PN} does not automatically load the app-laptop/tp_smapi"
	ewarn "modules, so you need to do it manually."
}
