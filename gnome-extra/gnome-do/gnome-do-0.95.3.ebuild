# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit gnome2 mono-env eutils

DESCRIPTION="GNOME Do allows you to get things done quickly"
HOMEPAGE="http://do.davebsd.com/"
SRC_URI="https://launchpad.net/do/trunk/${PV}/+download/${P}.tar.gz
	http://http.debian.net/debian/pool/main/g/gnome-do/gnome-do_0.95.3-5.debian.tar.xz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

RDEPEND="dev-lang/mono
	>=dev-dotnet/gtk-sharp-2.12.21
	dev-dotnet/ndesk-dbus
	dev-dotnet/ndesk-dbus-glib
	>=dev-dotnet/gnome-desktop-sharp-2.26.0
	>=dev-dotnet/gnome-keyring-sharp-1.0.0
	>=dev-dotnet/gnome-sharp-2.24.2-r1
	>=dev-dotnet/wnck-sharp-2.24.0
	>=dev-dotnet/rsvg-sharp-2.24.0
	dev-dotnet/mono-addins[gtk]
	dev-dotnet/notify-sharp
	dev-dotnet/gio-sharp
	dev-dotnet/gkeyfile-sharp
	!<gnome-extra/gnome-do-plugins-0.8.4"
DEPEND="${RDEPEND}
	>=dev-util/intltool-0.35
	virtual/pkgconfig"

src_prepare() {
	EPATCH_SOURCE="${WORKDIR}/debian/patches" EPATCH_SUFFIX="patch" EPATCH_FORCE="yes" epatch
	EPATCH_SOURCE="${WORKDIR}/debian/patches" EPATCH_SUFFIX="diff" EPATCH_FORCE="yes" epatch
	epatch_user
	default
}
