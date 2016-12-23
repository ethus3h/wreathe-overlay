# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit egit-r3

DESCRIPTION="A simple library (including Nuget Package) for Google Maps geolocation and reverse geolocation"
HOMEPAGE="https://github.com/sethwebster/GoogleMaps.LocationServices"
EGIT_REPO_URI="git://github.com/sethwebster/GoogleMaps.LocationServices.git"
EGIT_COMMIT="e01489c9b4083665e0764014d8fcd6eb270851ca"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="dev-dotnet/dotnet-cli
    dev-lang/mono"

DEPEND="${RDEPEND}"

src_compile() {
    xbuild 
}
