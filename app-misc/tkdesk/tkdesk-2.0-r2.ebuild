# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION=" TkDesk is a graphical file manager for Unix and the X-Window System."
HOMEPAGE="http://tkdesk.sourceforge.net/"
SRC_URI="mirror://sourceforge/tkdesk/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="x86"
IUSE=""

RDEPEND=">=dev-lang/tcl-8.0
         >=dev-tcltk/itcl-3.0.1
         >=dev-tcltk/blt-2.4z"

DEPEND="${RDEPEND}"

pkg_setup()
{
    # itcl libraries are not found by linker.
    # Maybe, this should be done by itcl ebuild. Bug in itcl package?
    echo 'LDPATH=/usr/lib/itcl3.3' > /etc/env.d/99libitcl-3.3
    env-update
}

src_unpack()
{
    unpack ${A}
    patch -p0 < ${FILESDIR}/${PF}.diff || die "patch failed."
    cd tkdesk-2.0
    patch -p1 < ${FILESDIR}/tkdesk-2.0p1.patch || die "patch p1 failed."
    patch -p1 < ${FILESDIR}/tkdesk-2.0p2.patch || die "patch p1 failed."
}

src_compile()
{
    ./configure --prefix="/usr" --with-blt="/usr/lib"
    emake || die "compile failed"
}

src_install()
{
    einstall || die "install failed"
}
