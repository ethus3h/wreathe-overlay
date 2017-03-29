# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="5"

DESCRIPTION="Virtual for LASH library"
HOMEPAGE=""
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86"
IUSE="python"

DEPEND=""
RDEPEND="|| ( media-sound/ladish[lash] media-sound/lash )
python? ( || ( media-sound/ladish[python] media-sound/lash[python] ) )"
