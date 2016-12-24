# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6

DESCRIPTION="Tomoyo KDE AMOR"
HOMEPAGE="http://kdelook.org/content/show.php/Tomoyo+KDE-AMOR?content=158273"
SRC_URI="http://kdelook.org/CONTENT/content-files/158273-tomoyo%20KDE-AMOR.zip"

LICENSE="LGPL"
SLOT="0"
KEYWORDS="~alpha amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86"

RDEPEND="trinity-base/amor"
DEPEND="${RDEPEND}"

S="${WORKDIR}"

src_install() {
    #dodir /usr/share/apps/amor/
    insinto /usr/trinity/14/share/apps/amor/
    doins -r "pics"
    doins "tomoyorc"
}
