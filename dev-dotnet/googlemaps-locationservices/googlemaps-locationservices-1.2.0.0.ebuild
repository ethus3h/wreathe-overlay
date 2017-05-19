# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
SLOT="0"

KEYWORDS="~amd64 ~ppc ~x86"
USE_DOTNET="net45"

inherit gac dotnet

myPackageName="GoogleMaps.LocationServices"
DESCRIPTION="Library for Google Maps geolocation and reverse geolocation"
HOMEPAGE="https://github.com/sethwebster/GoogleMaps.LocationServices"
SRC_URI="https://github.com/sethwebster/${myPackageName}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="dev-dotnet/nuget
	dev-lang/mono"

DEPEND="${RDEPEND}"

S="${WORKDIR}/${myPackageName}-${PV}"

src_prepare() {
	default
	rm -r .nuget
	sed -i -e 's#<BuildPackage>true</BuildPackage>#<BuildPackage>false</BuildPackage>#g' GoogleMaps.LocationServices/GoogleMaps.LocationServices.csproj || die
sed -i -e 's#<Import Project="$(SolutionDir)\\.nuget\\nuget.targets" />##g' GoogleMaps.LocationServices/GoogleMaps.LocationServices.csproj || die
}

src_compile() {
	exbuild_strong GoogleMaps.LocationServices.sln
}

src_install() {
	if use debug; then
		DIR="Debug"
	else
		DIR="Release"
	fi
	egacinstall "GoogleMaps.LocationServices/bin/${DIR}/GoogleMaps.LocationServices.dll"
	einstall_pc_file "${PN}" "${PV}" "GoogleMaps.LocationServices"
}
