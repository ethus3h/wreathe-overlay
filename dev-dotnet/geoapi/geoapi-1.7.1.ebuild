# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6
SLOT="0"

KEYWORDS="~amd64 ~ppc ~x86"
USE_DOTNET="net45"

inherit gac dotnet subversion

DESCRIPTION="OGC/ISO standards-based .NET GIS interoperability framework"
HOMEPAGE="https://github.com/NetTopologySuite/GeoAPI"
ESVN_REPO_URI="https://geoapi.svn.codeplex.com/svn/branches/v${PV}"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"

# dev-dotnet/dotnet-cli provided by wreathe-base
RDEPEND="app-misc/wreathe-base
	dev-lang/mono"

DEPEND="${RDEPEND}"
#FIXME: See dotnetzip-semverd for a working mono ebuild
src_compile() {
	./build.sh
}
